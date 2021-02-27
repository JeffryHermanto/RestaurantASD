import 'dart:convert';

class Restaurant {
  int id;
  String name;
  String image;
  String address;
  String description;
  String email;
  String website;
  String phoneNumber;
  int rating;

  Restaurant({
    this.id,
    this.name,
    this.image,
    this.address,
    this.description,
    this.email,
    this.website,
    this.phoneNumber,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'address': address,
      'description': description,
      'email': email,
      'website': website,
      'phoneNumber': phoneNumber,
      'rating': rating,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Restaurant(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      address: map['address'] as String,
      description: map['description'] as String,
      email: map['email'] as String,
      website: map['website'] as String,
      phoneNumber: map['phoneNumber'] as String,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source) as Map<String, dynamic>);
}
