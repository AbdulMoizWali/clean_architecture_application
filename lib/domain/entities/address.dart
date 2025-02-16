import 'package:equatable/equatable.dart';

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
