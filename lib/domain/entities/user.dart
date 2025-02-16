import 'package:equatable/equatable.dart';

import 'address.dart';
import 'company.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Company company;
  final Address address;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
    required this.address,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    username,
    email,
    phone,
    website,
    company,
    address,
  ];
}
