// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CitizenModel1 {
  int? id;
  String name;
  String email;
  int age;
  CitizenModel1({
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

  factory CitizenModel1.fromMap(Map<String, dynamic> map) {
    return CitizenModel1(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CitizenModel1.fromJson(String source) =>
      CitizenModel1.fromMap(json.decode(source) as Map<String, dynamic>);
}
