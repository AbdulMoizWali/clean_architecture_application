import 'package:clean_architecture_application/domain/repositories/todo_repository.dart';

class CreateTodo {
  final TodoRepository repository;

  CreateTodo(this.repository);

  Future<void> call({
    required int userId,
    required String title,
    required bool completed,
  }) async {
    return await repository.createTodo(
      userId: userId,
      title: title,
      completed: completed,
    );
  }
}
