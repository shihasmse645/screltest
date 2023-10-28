import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:screltest/Model/usermodel.dart';
import 'dart:convert';

class UserController extends ChangeNotifier {
  List<Users> _userList = [];
  List<Users> get userList => _userList;

  Future<void> fetchUsers() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      _userList = responseData.map((userJson) => Users.fromJson(userJson)).toList();
      notifyListeners();
    } else {
      throw Exception("Failed to fetch users");
    }
  }
}
