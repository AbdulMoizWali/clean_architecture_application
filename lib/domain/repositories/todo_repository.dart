import '../entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();

  Future<void> createTodo({
    required int userId,
    required String title,
    required bool completed,
  });

  Future<void> updateTodo({
    required int id,
    int? userId,
    String? title,
    bool? completed,
  });

  Future<void> deleteTodo({required int id});
}
