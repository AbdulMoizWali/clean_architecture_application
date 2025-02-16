import '../../domain/entities/address.dart';

class AddressDto extends Address {
  const AddressDto({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipCode,
    required super.geo,
  });

  factory AddressDto.fromJson(Map<String, dynamic> json) {
    return AddressDto(
      street: json["street"],
      suite: json["suite"],
      city: json["city"],
      zipCode: json["zipcode"],
      geo: json["geo"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "street": street,
      "suite": suite,
      "city": city,
      "zipcode": zipCode,
      "geo": geo,
    };
  }
}
