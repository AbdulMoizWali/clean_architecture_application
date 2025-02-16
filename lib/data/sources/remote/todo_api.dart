import 'dart:convert';

import '../../dto/todo_dto.dart';
import 'api.dart';

class TodoApi extends IApi {
  TodoApi() : super(routeName: "todos");

  Future<List<TodoDto>> getTodos() async {
    final response = await getApi();
    final body = jsonDecode(response.body) as List<Map<String, dynamic>>;
    List<TodoDto> todosList = body.map((e) => TodoDto.fromJson(e)).toList();
    return todosList;
  }
}
