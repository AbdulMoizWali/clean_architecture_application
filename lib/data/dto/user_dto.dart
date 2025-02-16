import '../../domain/entities/user.dart';
import 'address_dto.dart';
import 'company_dto.dart';

class UserDto extends User {
  const UserDto({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.phone,
    required super.website,
    required super.company,
    required super.address,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      website: json["website"],
      company: CompanyDto.fromJson(json["company"]),
      address: AddressDto.fromJson(json["address"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "username": username,
      "email": email,
      "phone": phone,
      "website": website,
      "company": (company as CompanyDto).toJson(),
      "address": (address as AddressDto).toJson(),
    };
  }
}
