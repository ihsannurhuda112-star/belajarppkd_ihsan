// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CitizenModel {
  int? id;
  String name;
  String email;
  int age;
  CitizenModel({
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

  factory CitizenModel.fromMap(Map<String, dynamic> map) {
    return CitizenModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CitizenModel.fromJson(String source) =>
      CitizenModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
