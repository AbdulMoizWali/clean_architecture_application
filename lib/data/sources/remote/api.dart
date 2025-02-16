import 'dart:io';

import 'package:clean_architecture_application/core/exception/network_exception.dart';
import 'package:http/http.dart' as http;

import '../../../config.dart';
import '../../../core/exception/api_exception.dart';

abstract class IApi {
  static const String baseUrl = Config.BASE_URL;

  /// like "users", "todos"
  final String routeName;

  const IApi({required this.routeName});

  String getUrl(String? endPoint) {
    return "$baseUrl/$routeName/$endPoint";
  }

  Future<http.Response> getApi({
    String endPoint = "",
    Map<String, String>? headers,
  }) async {
    var url = getUrl(endPoint);
    final uri = Uri.parse(url);
    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode != 200) {
        throw ApiException(
          "Failed to fetch data. $url",
          statusCode: response.statusCode,
        );
      }
      return response;
    } on SocketException catch (_) {
      throw NetworkException(
        "No internet connection. Please check your network.",
      );
    } catch (e) {
      throw NetworkException("Unexpected error: $e");
    }
  }
}
