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
    // check if the user Email is verified
    isVerified(){
     FirebaseAuth.instance.currentUser!.emailVerified==true ?true:false; 
      }

  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  // Checking if the user is signed in
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
      // code if the user is not signed in
    } else {
      print('User is signed in!');
      // code if the user is not signed in
    }
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // if the user signed in before we have no navigate to home not sign-in
      // if the currentUser == null that means the user is not signed in
      home: FirebaseAuth.instance.currentUser == null ? Login() : Homepage(),
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