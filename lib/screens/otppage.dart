import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shilingae/blocs/signupc.dart';

class otpPage extends StatefulWidget {
  int otp;
  String firstname;
  String lastname;
  String email;
  String mobile;
  String password;
  String calling_code;
  String app_country;
  String for_type;
  otpPage(
      {Key key,
      this.otp,
      this.firstname,
      this.lastname,
      this.email,
      this.mobile,
      this.password,
      this.calling_code,
      this.app_country,
      this.for_type})
      : super(key: key);

  @override
  _otpPageState createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  var onTapRecognizer;

  TextEditingController otpController = TextEditingController();
  // ..text = "123456";

  bool hasError = false;
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        title: Text(
          "OTP verification",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(
              "Enter 6-digit OTP code sent to your mobile no +" +
                  widget.calling_code +
                  widget.mobile,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 80),
            PinCodeTextField(
              onChanged: (v) {},
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.grey[300],
                fontWeight: FontWeight.bold,
              ),
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                inactiveColor: Colors.grey[300],
                activeColor: Colors.grey[300],
                selectedColor: Colors.red,
                disabledColor: Colors.grey,
              ),
              cursorColor: Colors.black,
              animationDuration: Duration(milliseconds: 300),
              textStyle: TextStyle(fontSize: 30, height: 1.6),
              backgroundColor: Colors.white,
              enableActiveFill: false,
              controller: otpController,
              keyboardType: TextInputType.number,
              onCompleted: (v) {
                print("Completed");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Re-send OTP",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: FlatButton(
                height: 55,
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  SignupBloc.OTP(
                      context,
                      widget.firstname,
                      widget.lastname,
                      widget.email,
                      widget.calling_code,
                      widget.mobile,
                      widget.password,
                      otpController.text,
                      widget.otp);
                },
                child: Text(
                  "Verify",
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
                text: TextSpan(
                  text: "Didn't receive an OTP yet ?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: ' Continue as Guest',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushNamed(context, '/login'),
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

            // Text(widget.otp.toString()),
            // Text(widget.email.toString()),
            // Text(widget.mobile.toString()),
            // Text(widget.password.toString()),
            // Text(widget.calling_code.toString()),
            // Text(widget.app_country.toString()),
            // Text(widget.for_type.toString()),
          ],
        ),
      ),
    );
  }
}
