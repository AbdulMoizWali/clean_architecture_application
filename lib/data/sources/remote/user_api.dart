import 'dart:convert';

import '../../dto/user_dto.dart';
import 'api.dart';

class UserApi extends IApi {
  UserApi() : super(routeName: "users");

  Future<List<UserDto>> getUsers() async {
    final response = await getApi();
    final body = jsonDecode(response.body) as List<Map<String, dynamic>>;
    List<UserDto> todosList = body.map((e) => UserDto.fromJson(e)).toList();
    return todosList;
  }
}
