import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shilingae/blocs/signupc.dart';

class otpPage extends StatefulWidget {
  int? otp;
  String? firstname;
  String? lastname;
  String? email;
  String? mobile;
  String? password;
  String? calling_code;
  String? app_country;
  String? for_type;
  otpPage(
      {Key? key,
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
          color:
              Theme.of(context).secondaryHeaderColor, //change your color here
        ),
        elevation: 0,
        title: Text(
          "OTP verification",
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(
              "Enter 6-digit OTP code sent to your mobile no +" +
                  widget.calling_code! +
                  widget.mobile!,
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor, fontSize: 18),
            ),
            SizedBox(height: 80),
            PinCodeTextField(
              onChanged: (v) {},
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Theme.of(context).dividerColor,
                fontWeight: FontWeight.bold,
              ),
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                inactiveColor: Theme.of(context).dividerColor,
                activeColor: Theme.of(context).dividerColor,
                selectedColor: Theme.of(context).primaryColor,
                disabledColor: Theme.of(context).dividerColor,
              ),
              cursorColor: Theme.of(context).secondaryHeaderColor,
              animationDuration: Duration(milliseconds: 300),
              textStyle: TextStyle(fontSize: 30, height: 1.6),
              backgroundColor:
                  Theme.of(context).textSelectionTheme.selectionHandleColor,
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
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: MaterialButton(
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
                    color: Theme.of(context)
                        .textSelectionTheme
                        .selectionHandleColor,
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
                text: TextSpan(
                  text: "Didn't receive an OTP yet ?",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: ' Continue as Guest',
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
