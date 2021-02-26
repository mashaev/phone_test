import 'package:flutter/material.dart';
import 'package:test_phone_auth/auth.dart';
import 'package:test_phone_auth/login_screen.dart';

void main() {
  runApp(MyApp());
  //var authService = Auth();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
