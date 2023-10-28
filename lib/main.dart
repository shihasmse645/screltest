import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screltest/controller/usercontroller.dart';
import 'package:screltest/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User App',
        home: Home()
      ),
    );
  }
}
