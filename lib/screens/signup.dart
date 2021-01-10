import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shilingae/blocs/signupc.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _showPassword = false;
  TextEditingController fnController = TextEditingController();
  TextEditingController lnController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pass1Controller = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String countrycode;

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
                "signup".tr().toString(),
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: fnController,
                style: TextStyle(
                  fontSize: 17,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                ),
                cursorColor: Colors.teal,
                scrollPadding: EdgeInsets.only(left: 40.0),
                decoration: InputDecoration(
                  labelText: 'firstName'.tr().toString(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 23,
                    height: .6,
                  ),
                  border: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300])),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300])),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.red)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: lnController,
                style: TextStyle(
                  fontSize: 17,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                ),
                cursorColor: Colors.teal,
                scrollPadding: EdgeInsets.only(left: 40.0),
                decoration: InputDecoration(
                  labelText: 'lastName'.tr().toString(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 23,
                    height: .6,
                  ),
                  border: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300])),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300])),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.red)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                style: TextStyle(
                  fontSize: 17,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                ),
                cursorColor: Colors.teal,
                keyboardType: TextInputType.emailAddress,
                scrollPadding: EdgeInsets.only(left: 40.0),
                decoration: InputDecoration(
                  labelText: 'email'.tr().toString(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 23,
                    height: .6,
                  ),
                  border: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300])),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300])),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.red)),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "mobileNumber".tr().toString(),
                style: TextStyle(
                  color: Color(0xff808080),
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                ),
                child: IntlPhoneField(
                  onSubmitted: (ass) {
                    print("ssdsooo");
                  },
                  onSaved: (val) {
                    print("hooo");
                  },
                  onTap: () {
                    print("hi");
                  },
                  controller: phoneController,
                  showDropdownIcon: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  initialCountryCode: 'ET',
                  onChanged: (phone) {
                    countrycode = phone.countryCode;
                  },
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: pass1Controller,
                obscureText: true,
                style: TextStyle(
                  fontSize: 17,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                ),
                cursorColor: Colors.teal,
                scrollPadding: EdgeInsets.only(left: 40.0),
                decoration: InputDecoration(
                  labelText: 'password'.tr().toString(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 23,
                    height: 0,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                  border: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300])),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300])),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.red)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: pass2Controller,
                obscureText: true,
                style: TextStyle(
                  fontSize: 17,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                ),
                cursorColor: Colors.teal,
                scrollPadding: EdgeInsets.only(left: 40.0),
                decoration: InputDecoration(
                  labelText: 'confirmNewPassword'.tr().toString(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 23,
                    height: 0,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                  border: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300])),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[300])),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.red)),
                ),
              ),
              SizedBox(height: 40),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: FlatButton(
                  height: 55,
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    SignupBloc.SignUp(
                      context,
                      fnController,
                      lnController,
                      emailController,
                      countrycode,
                      phoneController,
                      pass1Controller,
                      pass2Controller,
                    );
                  },
                  child: Text(
                    "continue".tr().toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  color: Color(0xffE43134),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "alreadyHaveAccount".tr().toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: 'login'.tr().toString(),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => Navigator.pushNamed(context, '/login'),
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
