
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firetest/components/custombuttonauth.dart';
import 'package:firetest/components/customlogoauth.dart';
import 'package:firetest/components/textformfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
// -----------------------------------------------to be an image
  // Create a user using FirebaseAuth
  CreateAccount()async {
    try {
      // Create an instants from FirebaseAuth
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    // Pass the email and password Controller
    email: email.text,
    password: password.text,
  );
  FirebaseAuth.instance.currentUser!.sendEmailVerification();
  Navigator.of(context).pushReplacementNamed("login");
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
// -------------------------------------------------to be an image
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 50),
              const CustomLogoAuth(),
              Container(height: 20),
              const Text("SignUp",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Container(height: 10),
              const Text("SignUp To Continue Using The App",
                  style: TextStyle(color: Colors.grey)),
              Container(height: 20),
              const Text(
                "username",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(height: 10),
              CustomTextForm(
                  hinttext: "ُEnter Your username", mycontroller: username),
              Container(height: 20),
              const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(height: 10),
              CustomTextForm(
                  hinttext: "ُEnter Your Email", mycontroller: email),
              Container(height: 10),
              const Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(height: 10),
              CustomTextForm(
                  hinttext: "ُEnter Your Password", mycontroller: password),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                alignment: Alignment.topRight,
                child: const Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          CustomButtonAuth(title: "SignUp", onPressed: () {
                     CreateAccount();
          }),
          Container(height: 20),

          Container(height: 20),
          // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("login") ; 
            },
            child: const Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Have An Account ? ",
                ),
                TextSpan(
                    text: "Login",
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold)),
              ])),
            ),
          )
        ]),
      ),
    );
  }
}