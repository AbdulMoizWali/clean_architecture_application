import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../dto/todo_dto.dart';
import '../sources/local/todo_cache.dart';
import '../sources/remote/todo_api.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoApi todoApi;

  List<Todo>? _cache;
  final TodoCache _todoCache = TodoCache();

  TodoRepositoryImpl(this.todoApi);

  @override
  Future<void> deleteTodo({required int id}) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodos() async {
    if (_cache != null && _cache!.isNotEmpty) {
      return _cache!;
    }

    final cachedTodos = await _todoCache.getCachedData();
    if (cachedTodos != null && cachedTodos.isNotEmpty) {
      _cache = cachedTodos.map((e) => TodoDto.fromJson(e)).toList();
      return _cache!;
    }

    try {
      final todos = await todoApi.getTodos();
      _cache = todos;
      await _todoCache.saveData(todos.map((e) => e.toJson()).toList(), 'id');
      return _cache!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createTodo({
    required int userId,
    required String title,
    required bool completed,
  }) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo({
    required int id,
    int? userId,
    String? title,
    bool? completed,
  }) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
