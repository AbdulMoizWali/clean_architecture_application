import '../entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();

  Future<void> createTodo({int userId, String title, bool completed});

  Future<void> updateTodo({int id, int userId, String title, bool completed});

  Future<void> deleteTodo({int id});
}
