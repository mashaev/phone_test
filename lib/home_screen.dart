import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_phone_auth/auth.dart';
import 'package:test_phone_auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseUser user;
  final FirebaseAuth auth;
  HomeScreen({this.user, this.auth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Дома'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => auth.signOut().then((value) =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()))),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "You are Logged in succesfully",
              style: TextStyle(color: Colors.lightBlue, fontSize: 32),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "${user.phoneNumber}",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
