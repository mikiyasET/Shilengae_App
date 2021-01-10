import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot Password",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Text(
                "Mobile Number",
                style: TextStyle(
                  color: Color(0xff808080),
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              TextField(
                style: TextStyle(
                    fontSize: 17, height: 1.3, fontWeight: FontWeight.w700),
                keyboardType: TextInputType.number,
                cursorColor: Colors.teal,
                scrollPadding: EdgeInsets.only(left: 40.0),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey[300],
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey[300],
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey[300],
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: IntlPhoneField(
                      onTap: () {},
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: "+251",
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: FlatButton(
                  height: 55,
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {},
                  child: Text(
                    "Continue",
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
