import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:reservrec/login_page.dart';
import 'package:reservrec/user_functions.dart';
import 'package:reservrec/main.dart';

import 'file_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPController = TextEditingController();
  final emailController = TextEditingController();
  var snackController = TextEditingController();
  var message = "empty";

  @override
  Widget build(BuildContext context) {
    // TODO Change To be custom profile picture
    final logo = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'hero',
          child: SizedBox(
            height: 160,
            child: Image.asset('assets/defaultuser.png'),
          )
      ),
    );

    final inputUsername = Padding(
      padding: EdgeInsets.all(5),
      child: TextField(
        keyboardType: TextInputType.name,
        controller: usernameController,
        decoration: InputDecoration(
            hintText: 'Username',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0)
            )
        ),
      ),
    );

    final inputPassword = Padding(
      padding: EdgeInsets.all(5),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        controller: passwordController,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0)
            )
        ),
      ),
    );

    final inputConfirmPassword = Padding(
      padding: EdgeInsets.all(5),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        controller: confirmPController,
        decoration: InputDecoration(
            hintText: 'Confirm Password',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0)
            )
        ),
      ),
    );

    final inputEmail = Padding(
      padding: EdgeInsets.all(5),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0)
            )
        ),
      ),
    );

    final buttonSignUp = Padding(
      padding: EdgeInsets.all(5),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child: Text('Sign-Up', style: TextStyle(color: Colors.white, fontSize: 20)),
          color: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          ),
          onPressed: () async {
            final User user = await signUpWithEmailAndPassword(usernameController.text, passwordController.text, confirmPController.text, emailController.text);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ),
    );

    final buttonBack = Padding(
      padding: EdgeInsets.all(5),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child: Text('Back', style: TextStyle(color: Colors.white, fontSize: 20)),
          color: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          ),
          onPressed: () async {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
          body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: <Widget>[
                logo,
                inputUsername,
                inputPassword,
                inputConfirmPassword,
                inputEmail,
                buttonSignUp,
                buttonBack,
              ],
            ),

          ),
        )
    );
  }
}