// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:test_phone_auth/home_screen.dart';

// abstract class BaseAuth {
//   Future<String> signIn(String email, String password);

//   Future<String> signUp(String email, String password);

//   Future<FirebaseUser> getCurrentUser();

//   Future<void> sendEmailVerification();

//   Future<void> signOut();

//   Future<bool> isEmailVerified();

//   //Future<String> signInWithGoogle();

//   //void signOutGoogle();
// }

// class Auth {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// }
//   // final GoogleSignIn googleSignIn = GoogleSignIn();
//   FirebaseUser user;

//   Future<String> signIn(String email, String password) async {
//     user = (await _firebaseAuth.signInWithEmailAndPassword(
//             email: email, password: password))
//         .user;
//     return user.email;
//   }

//   Future<String> signUp(String email, String password) async {
//     FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(
//             email: email, password: password))
//         .user;
//     return user.uid;
//   }

//   Future<FirebaseUser> getCurrentUser() async {
//     user = await _firebaseAuth.currentUser();
//     return user;
//   }

//   signOut() async {
//     print("signed in user: $user");
//     await _firebaseAuth.signOut();
//   }

//   Future<void> sendEmailVerification() async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     user.sendEmailVerification();
//   }

//   Future<bool> isEmailVerified() async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     return user.isEmailVerified;
//   }

//   // Future<String> signInWithGoogle() async {
//   //   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   //   final GoogleSignInAuthentication googleSignInAuthentication =
//   //   await googleSignInAccount.authentication;

//   //   final AuthCredential credential = GoogleAuthProvider.getCredential(
//   //     accessToken: googleSignInAuthentication.accessToken,
//   //     idToken: googleSignInAuthentication.idToken,
//   //   );

//   //  user = (await _firebaseAuth.signInWithCredential(credential)).user;

//   //   assert(!user.isAnonymous);
//   //   assert(await user.getIdToken() != null);

//   //   final FirebaseUser currentUser = await _firebaseAuth.currentUser();
//   //   assert(user.uid == currentUser.uid);
//   //   return 'signInWithGoogle succeeded: $user';
//   // }
// }

// final Auth authService = Auth();
