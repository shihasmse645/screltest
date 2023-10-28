import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:screltest/Model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:screltest/screens/userdetails.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Users> userlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserDetails(userId:userlist[index].id.toString(), user: userlist[index],)));
                    },
                    child: ListTile(
                      title: Text(userlist[index].name.toString()),
                    ),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<List<Users>> getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        userlist.add(Users.fromJson(index));
      }
      return userlist;
    } else {
      return userlist;
    }
  }
}
