import 'package:flutter/material.dart';
import 'package:shilingae/screens/loginInputs.dart';
import 'package:get/get.dart';

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
        iconTheme: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "login".tr,
                style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 40),
              Text(
                "mobileNumber".tr,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
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
