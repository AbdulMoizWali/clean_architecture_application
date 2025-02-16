import 'package:clean_architecture_application/data/sources/local/base_cache.dart';

class TodoCache extends BaseCache {
  TodoCache() : super(dbName: 'todo_cache.db', storeName: 'TodoStore');

  @override
  int get cacheTTL => 5 * 60 * 1000;
}
