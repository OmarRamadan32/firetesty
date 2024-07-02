import 'package:firebase_auth/firebase_auth.dart';
import 'package:firetest/auth/login.dart';
import 'package:firetest/auth/signup.dart';
import 'package:firetest/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // if the user signed in before we have no navigate to home not sign-in
      // if the currentUser == null that means the user is not signed in
      home: Login(),
      routes: {
        "signup" : (context) => SignUp() , 
        "login" : (context) => Login(),
        "homepage": (context) => Homepage()
      },
    );
  }
}


// To be an Images
/*


*/