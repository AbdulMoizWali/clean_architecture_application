import '../entities/address.dart';
import '../entities/company.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();

  Future<void> createUser({
    String name,
    String username,
    String email,
    String phone,
    String website,
    Company company,
    Address address,
  });

  Future<void> updateUser({
    int id,
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
