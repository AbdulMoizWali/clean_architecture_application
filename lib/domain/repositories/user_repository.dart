import '../entities/address.dart';
import '../entities/company.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();

  Future<void> createUser({
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
    required Company company,
    required Address address,
  });

  Future<void> updateUser({
    required int id,
    String name,
    String username,
    String email,
    String phone,
    String website,
    Company company,
    Address address,
  });

  Future<void> deleteUser({int id});
}
