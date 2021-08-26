import 'dart:ui';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenPageState createState() =>
      _ForgotPasswordScreenPageState();
}

class _ForgotPasswordScreenPageState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            //backgroundColor: Colors.lightBlueAccent,
            body: Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Email Your Email',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                errorStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Send Email'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Sign In'),
              onPressed: () {},
            )
          ],
        ),
      ),
    )));
  }
}
