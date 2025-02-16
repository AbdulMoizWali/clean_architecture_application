import 'package:equatable/equatable.dart';

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

class Company extends Equatable {
  final String name;
  final String catchPhrase;
  final String bs;

  const Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  @override
  List<Object?> get props => [name, catchPhrase, bs];
}

class Address extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipCode;
  final Geo geo;

  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipCode,
    required this.geo,
  });

  @override
  List<Object?> get props => [street, suite, city, zipCode, geo];
}

class Geo extends Equatable {
  final String lat;
  final String lng;

  const Geo({required this.lat, required this.lng});

  @override
  List<Object?> get props => [lat, lng];
}
