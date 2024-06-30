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
----------------------------------------------------------------------
  // Sign in Function
  SignIn() async {
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email.text,
    password: password.text
  );
  // Code if the Signin is successful
  Navigator.of(context).pushReplacementNamed("homepage");

}
// checking if there any errors 
 on FirebaseAuthException catch (e) {
  // if the user not found
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
    // if the password is wrong
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }
------------------------------------Create a user using FirebaseAuth---------

  CreateAccount()async {
    try {
      // Create an instants from FirebaseAuth
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    // Pass the email and password Controller
    email: email.text,
    password: password.text,
  );
  Navigator.of(context).pushReplacementNamed("homepage");
  // Code if the Signin is successful
  
  
}
// checking if there any errors 
on FirebaseAuthException catch (e) {
  // if the password is too weak
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
    // if the email is already in use
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }

----------------------------------Sign Out Function---------------------
await FirebaseAuth.instance.signOut();
and then we have the navigate to sign-in page

--------------------------------user currentstate----------------------------------------
 if the user signed in before we have no navigate to home not sign-in
 if the currentUser == null that means the user is not signed in
 home: FirebaseAuth.instance.currentUser == null ? Login() : Homepage(),
---------------------------------------authStateChanges----------------------------------
 Checking if the user is signed in
 initState
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

*/