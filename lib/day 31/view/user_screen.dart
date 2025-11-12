import 'package:belajarppkd_ihsan/day%2031/models/game_of_thornes.dart';
import 'package:belajarppkd_ihsan/day%2031/service/api.dart';
import 'package:flutter/material.dart';
import 'package:belajarppkd_ihsan/day%2031/view/character_detail_screen.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late Future<List<GameOfThornes>> futureCharacters;
  List<GameOfThornes> allCharacters = [];
  List<GameOfThornes> filteredCharacters = [];
  String searchQuery = "";
  String? selectedHouse = 'All';

  final List<String> houses = [
    'All',
    'House Stark',
    'House Lannister',
    'House Targaryen',
    'House Baratheon',
    'House Greyjoy',
    'House Tyrell',
    'House Martell',
  ];

  @override
  void initState() {
    super.initState();
    futureCharacters = ApiService().getAllCharacters();
  }

  void filterCharacters() {
    setState(() {
      filteredCharacters = allCharacters.where((character) {
        final matchName =
            character.fullName?.toLowerCase().contains(
              searchQuery.toLowerCase(),
            ) ??
            false;
        final matchHouse =
            (selectedHouse == 'All' || character.family == selectedHouse);
        return matchName && matchHouse;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Game of Thrones Characters",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<GameOfThornes>>(
        future: futureCharacters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No characters found"));
          }

          allCharacters = snapshot.data!;
          if (filteredCharacters.isEmpty &&
              searchQuery.isEmpty &&
              selectedHouse == 'All') {
            filteredCharacters = allCharacters;
          }

          return RefreshIndicator(
            onRefresh: () async {
              setState(() {
                futureCharacters = ApiService().getAllCharacters();
              });
            },
            child: Column(
              children: [
                //  Search Bar
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Search character...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      searchQuery = value;
                      filterCharacters();
                    },
                  ),
                ),

                // Dropdown House Filter
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    value: selectedHouse,
                    isExpanded: true,
                    items: houses
                        .map(
                          (house) => DropdownMenuItem(
                            value: house,
                            child: Text(house),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedHouse = value;
                        filterCharacters();
                      });
                    },
                  ),
                ),

                const SizedBox(height: 10),

                // GridView Karakter
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 kolom
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.75, // proporsi kartu
                        ),
                    itemCount: filteredCharacters.length,
                    itemBuilder: (context, index) {
                      final character = filteredCharacters[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CharacterDetailScreen(character: character),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  character.imageUrl ?? '',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.error, size: 40),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      character.fullName ?? "Unknown",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      character.family ?? "",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
