import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/user_model.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<http.Response> signIn() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users'),
    );

    return response;
  }

  Future<http.Response> getPosts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/posts'),
    );
    return response;
  }
}
