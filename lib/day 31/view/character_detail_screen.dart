import 'package:flutter/material.dart';
import 'package:belajarppkd_ihsan/day%2031/models/game_of_thornes.dart';

class CharacterDetailScreen extends StatelessWidget {
  final GameOfThornes character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.fullName ?? "Detail Karakter"),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //  Foto karakter
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                character.imageUrl ?? '',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            //  Info karakter
            Text(
              character.fullName ?? 'Unknown',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              character.title ?? '-',
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "House: ${character.family ?? '-'}",
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Tambahan info opsional
            Text(
              "ID Karakter: ${character.id}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
