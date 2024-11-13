import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

class ApiHelper {
  final String _baseUrl = dotenv.env['BASE_URL'] ?? '', _userDetailsEndpoint = "/users";

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl+_userDetailsEndpoint));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load users");
      }
    } catch (error) {
      print("Error fetching users: $error");
      throw Exception("Failed to load users");
    }
  }
}