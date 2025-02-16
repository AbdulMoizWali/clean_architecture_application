import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

abstract class BaseCache {
  final String dbName;
  final String storeName;

  BaseCache({required this.dbName, required this.storeName}) {
    store = stringMapStoreFactory.store(storeName);
  }

  static const String _timestamp = "TimeStamp";

  /// Must be in milliseconds 5 * 60 * 1000 = 5 min
  int get cacheTTL;

  Database? _database;
  late final StoreRef<String, Map<String, dynamic>> store;

  Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String dbPath = join(directory.path, dbName);
    final db = await databaseFactoryIo.openDatabase(
      dbPath,
      mode: DatabaseMode.create,
      version: 1,
    );
    await saveTimestamp(db);
    return db;
  }

  /// [uniqueFieldName] is to be present on the data and should be unique. Uniqueness is not checked here
  /// Value of [uniqueFieldName] will be converted to String and act as key
  Future<void> saveData(
    List<Map<String, dynamic>> data,
    String uniqueFieldName,
  ) async {
    final db = await getDatabase();
    await deleteDB(db);
    await saveTimestamp(db);
    for (var element in data) {
      final String key = element[uniqueFieldName].toString();
      await store.record(key).put(db, element);
    }
  }

  Future<List<Map<String, dynamic>>?> getCachedData() async {
    final db = await getDatabase();
    final int? cachedTimestamp = await getCachedTimestamp(db);
    if (cachedTimestamp == null) return null;
    final int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    if ((currentTimestamp - cachedTimestamp) > cacheTTL) return null;
    final records = await store.find(db);
    return records.map((e) => e.value).toList();
  }

  Future<int?> getCachedTimestamp(Database db) async {
    final timestampRecord = await store.record(_timestamp).get(db);
    if (timestampRecord == null) return null;
    return timestampRecord[_timestamp] as int;
  }

  Future<void> saveTimestamp(Database db) async {
    final int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    await store.record(_timestamp).put(db, {_timestamp: currentTimestamp});
  }

  Future<void> deleteDB(Database db) async {
    await store.delete(db);
  }
}
