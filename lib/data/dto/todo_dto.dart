import '../../domain/entities/todo.dart';

class TodoDto extends Todo {
  const TodoDto({
    required super.userId,
    required super.id,
    required super.title,
    required super.completed,
  });

  factory TodoDto.fromJson(Map<String, dynamic> json) {
    return TodoDto(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      completed: json["completed"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"userId": userId, "id": id, "title": title, "completed": completed};
  }
}
