import '../../domain/entities/address.dart';
import '../../domain/entities/company.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../dto/user_dto.dart';
import '../sources/local/user_cache.dart';
import '../sources/remote/user_api.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi userApi;

  List<User>? _cache;
  final UserCache _userCache = UserCache();

  UserRepositoryImpl(this.userApi);

  @override
  Future<void> createUser({
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
    required Company company,
    required Address address,
  }) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser({required int id}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() async {
    if (_cache != null && _cache!.isNotEmpty) {
      return _cache!;
    }

    final cachedUsers = await _userCache.getCachedData();
    if (cachedUsers != null && cachedUsers.isNotEmpty) {
      _cache = cachedUsers.map((e) => UserDto.fromJson(e)).toList();
      return _cache!;
    }

    try {
      final users = await userApi.getUsers();
      _cache = users;
      await _userCache.saveData(users.map((e) => e.toJson()).toList(), 'id');
      return _cache!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUser({
    required int id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? website,
    Company? company,
    Address? address,
  }) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
