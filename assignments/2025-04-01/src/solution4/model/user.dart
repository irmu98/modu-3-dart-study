import 'address.dart';
import 'company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company
  }) {
    return User(id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        email: email ?? this.email,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        website: website ?? this.website,
        company: company ?? this.company
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User && runtimeType == other.runtimeType && id == other.id &&
              name == other.name && username == other.username &&
              email == other.email && address == other.address &&
              phone == other.phone && website == other.website &&
              company == other.company;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ username.hashCode ^ email.hashCode ^ address
          .hashCode ^ phone.hashCode ^ website.hashCode ^ company.hashCode;

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company}';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      website: json['website'] as String,
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "username": username,
      "email": email,
      "address": address.toJson(),
      "phone": phone,
      "website": website,
      "company": company.toJson()
    };
  }
}
