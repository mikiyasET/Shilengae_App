import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shilingae/blocs/forgotc.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController phoneController = TextEditingController();
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
                "forgotPassword".tr().toString(),
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
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
                  keyboardType: TextInputType.number,
                  initialCountryCode: 'ET',
                  onChanged: (phone) {
                    countrycode = phone.countryCode;
                  },
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
                    ForgotBloc.password(context, phoneController, countrycode);
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
            ],
          ),
        ),
      ),
    );
  }
}
