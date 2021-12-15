import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// initializing the firebase app
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDptU8UyI7lx9HN2WXHAfwGsa57GPpj8P0",
          authDomain: "blogapplication-3a0ca.firebaseapp.com",
          projectId: "blogapplication-3a0ca",
          storageBucket: "blogapplication-3a0ca.appspot.com",
          messagingSenderId: "609421566052",
          appId: "1:609421566052:web:5c0d2a715d55523150ff71",
          measurementId: "G-13SWSF1G9R"
      ));

// calling of runApp
  runApp(GoogleSignIn());
}

class GoogleSignIn extends StatefulWidget {
  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  @override
  Widget build(BuildContext context) {
    // we return the MaterialApp here ,
    // MaterialApp contain some basic ui for android ,
    return MaterialApp(
      //materialApp title
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      // home property contain SignInScreen widget
      home: LoginPageWidget(),
    );
  }
}
