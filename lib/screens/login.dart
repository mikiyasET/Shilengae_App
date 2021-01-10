import 'package:flutter/material.dart';
import 'package:shilingae/screens/loginInputs.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 40),
              Text(
                "Mobile Number",
                style: TextStyle(
                  color: Color(0xff808080),
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              LoginInputs()
            ],
          ),
        ),
      ),
    );
  }
}
