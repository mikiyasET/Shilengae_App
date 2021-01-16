import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shilingae/blocs/signupc.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _showPassword = false;
  bool _showPassword1 = false;
  TextEditingController fnController = TextEditingController();
  TextEditingController lnController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pass1Controller = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String countrycode;
  FocusNode phoneNode = FocusNode();

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
                "signup".tr,
                style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w500),
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
                  labelText: 'firstName'.tr,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: .6,
                  ),
                  border: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context).dividerColor)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context).dividerColor)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context).primaryColor)),
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
                  labelText: 'lastName'.tr,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: .6,
                  ),
                  border: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context).dividerColor)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context).dividerColor)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context).primaryColor)),
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
                  labelText: 'email'.tr,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: .6,
                  ),
                  border: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context).dividerColor)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context).dividerColor)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Theme.of(context).primaryColor)),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "mobileNumber".tr,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Theme.of(context).dividerColor),
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
                  onCountry: (value) {
                    print(value);
                    phoneController.clear();
                    phoneNode.requestFocus();
                  },
                  focusNode: phoneNode,
                  maxLength: 12,
                  controller: phoneController,
                  showDropdownIcon: false,
                  decoration: InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  initialCountryCode: 'ET',
                  onChanged: (phone) {
                    print("changed");
                    countrycode = phone.countryCode;
                  },
                ),
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  TextFormField(
                    controller: pass1Controller,
                    obscureText: _showPassword ? false : true,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.3,
                      fontWeight: FontWeight.w700,
                    ),
                    cursorColor: Colors.teal,
                    scrollPadding: EdgeInsets.only(left: 40.0),
                    decoration: InputDecoration(
                      labelText: 'password'.tr,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 0,
                      ),
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(_showPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Theme.of(context).dividerColor,
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  TextFormField(
                    controller: pass2Controller,
                    obscureText: _showPassword1 ? false : true,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.3,
                      fontWeight: FontWeight.w700,
                    ),
                    cursorColor: Colors.teal,
                    scrollPadding: EdgeInsets.only(left: 40.0),
                    decoration: InputDecoration(
                      labelText: 'confirmNewPassword'.tr,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 0,
                      ),
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(_showPassword1
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Theme.of(context).dividerColor,
                          onPressed: () {
                            setState(() {
                              _showPassword1 = !_showPassword1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
                    "continue".tr,
                    style: TextStyle(
                      color: Theme.of(context).textSelectionColor,
                      fontSize: 18.0,
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "alreadyHaveAccount".tr,
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: 'login'.tr,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed('/login'),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
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
