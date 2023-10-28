import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:screltest/Model/usermodel.dart';

class webservice {
  Future<List<Users>> getUsers() async {
    final url = "https://jsonplaceholder.typicode.com/users";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Users> userList = responseData.map((userJson) {
        return Users.fromJson(userJson);
      }).toList();
      return userList;
    } else {
      throw Exception("Failed to fetch users");
    }
  }

  
}
