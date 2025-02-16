import '../../entities/address.dart';
import '../../entities/company.dart';
import '../../repositories/user_repository.dart';

class CreateUser {
  final UserRepository repository;

  CreateUser(this.repository);

  Future<void> call({
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
    required Company company,
    required Address address,
  }) async {
    return await repository.createUser(
      name: name,
      username: username,
      email: email,
      phone: phone,
      website: website,
      company: company,
      address: address,
    );
  }
}
