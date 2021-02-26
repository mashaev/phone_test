import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:test_phone_auth/auth.dart';
import 'package:test_phone_auth/home_screen.dart';

class LoginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future<void> loginUser(String phone, context) async {
    // FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          // Navigator.of(context).pop();
          try {
            AuthResult result =
                await firebaseAuth.signInWithCredential(credential);

            FirebaseUser user = result.user;

            if (user != null) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            } else {
              print("Error");
            }
          } catch (e) {
            print("Login not successful");
            Navigator.pop(context);
          }
          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);

                        AuthResult result =
                            await firebaseAuth.signInWithCredential(credential);

                        FirebaseUser user = result.user;

                        if (user != null) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                        user: user,
                                        auth: firebaseAuth,
                                      )));
                        } else {
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(32),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 36,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                // keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[200])),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[300])),
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintText: "Введите номер"),
                controller: _phoneController,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  child: Text("LOGIN"),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(16),
                  onPressed: () {
                    final phone = _phoneController.text.trim();
                    //final code = _codeController.text.trim();
                    // final code = .text.trim(_codeController);

                    loginUser(phone, context);
                  },
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
