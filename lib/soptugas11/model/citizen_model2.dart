import 'dart:convert';

class CitizenModel2 {
  int? id;
  String name;
  String email;
  int age;
  CitizenModel2({
    this.id,
    required this.name,
    required this.email,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'age': age,
    };
  }

  factory CitizenModel2.fromMap(Map<String, dynamic> map) {
    return CitizenModel2(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CitizenModel2.fromJson(String source) =>
      CitizenModel2.fromMap(json.decode(source) as Map<String, dynamic>);
}
