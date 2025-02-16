import 'package:clean_architecture_application/data/sources/local/base_cache.dart';

class UserCache extends BaseCache {
  UserCache() : super(dbName: 'user_cache.db', storeName: 'UserStore');

  @override
  int get cacheTTL => 5 * 60 * 1000;
}
