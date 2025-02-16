import '../../domain/entities/company.dart';

class CompanyDto extends Company {
  const CompanyDto({
    required super.name,
    required super.catchPhrase,
    required super.bs,
  });

  factory CompanyDto.fromJson(Map<String, dynamic> json) {
    return CompanyDto(
      name: json["name"],
      catchPhrase: json["catchPhrase"],
      bs: json["bs"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "catchPhrase": catchPhrase, "bs": bs};
  }
}
