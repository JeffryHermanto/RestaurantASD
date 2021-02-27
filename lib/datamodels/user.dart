import 'dart:convert';

class User {
  String id;
  String email;
  String password;
  String nickname;
  DateTime dateOfBirth;
  String gender;
  String address;
  String nationality;

  User({
    this.id,
    this.email,
    this.password,
    this.nickname,
    this.dateOfBirth,
    this.gender,
    this.address,
    this.nationality,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'nickname': nickname,
      'dateOfBirth': dateOfBirth?.millisecondsSinceEpoch,
      'gender': gender,
      'address': address,
      'nationality': nationality,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      id: map['id'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      nickname: map['nickname'] as String,
      dateOfBirth: map['dateOfBirth'] as DateTime,
      gender: map['gender'] as String,
      address: map['address'] as String,
      nationality: map['nationality'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
