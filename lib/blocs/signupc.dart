import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:shilingae/screens/otppage.dart';

class SignupBloc {
  static Future<void> SignUp(
      context, first, last, emailad, code, phone, password1, password2) async {
    try {
      String firstName = first.text;
      String lastName = last.text;

      String email = emailad.text;
      String mobile = phone.text;
      String pass1 = password1.text;
      String pass2 = password2.text;
      print("yebereke almlak");
      if (firstName.length < 2) {
        Fluttertoast.showToast(
          msg: "First Name should be atleast 2 characters long",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else if (lastName.length < 2) {
        Fluttertoast.showToast(
          msg: "Last Name should be atleast 2 characters long",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else if (!RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email)) {
        Fluttertoast.showToast(
          msg: "Please enter a valid email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{7,12}$)').hasMatch(mobile)) {
        Fluttertoast.showToast(
          msg: "Please enter a valid Mobile Number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else if (pass1.length < 6 ||
          pass1.length > 15 ||
          pass2.length < 6 ||
          pass2.length > 15) {
        Fluttertoast.showToast(
          msg: "Password can contain minimum of 6 and maximum of 15 characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else if (pass1 != pass2) {
        Fluttertoast.showToast(
          msg: "Passwords don't match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else {
        print("hello");
        String countrycode =
            code.toString().substring(1, code.toString().length);
        String number = mobile;
        if ((number[0] + number[1]) == "09") {
          mobile = number.substring(1, number.length);
        } else if (number[0] == "+") {
          mobile = number.substring(countrycode.length + 1, number.length);
        } else if (mobile.startsWith('251', 0)) {
          mobile = number.substring(3, number.length);

          
        }
        var otp_url = 'https://test.shilengae.com/api/sendOtp';
        var res = await http.post(otp_url, body: {
          'email': email,
          'mobile': mobile,
          'password': pass2,
          'calling_code': countrycode,
          'app_country': "ET",
          'for_type': "0"
        });
        if (res.statusCode == 200 || res.statusCode == 400) {
          var jr = convert.jsonDecode(res.body);
          if (jr['success'] == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => otpPage(
                        firstname: firstName,
                        lastname: lastName,
                        otp: jr['otp'],
                        email: email,
                        mobile: mobile,
                        password: pass2,
                        calling_code: countrycode,
                        app_country: "ET",
                        for_type: "0")));
          } else {
            Fluttertoast.showToast(
              msg: "Can't send otp to your number",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              timeInSecForIosWeb: 1,
              fontSize: 16.0,
            );
          }
          print(res.body);
        } else {
          Fluttertoast.showToast(
            msg: "Unexpected Error!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            timeInSecForIosWeb: 1,
            fontSize: 16.0,
          );
        }
      }

      // var url2 = 'https://test.shilengae.com/api/sendOtp';
      // var response2 = await http.post(url, body: {
      //   'email': email,
      //   'mobile': mobile,
      //   'password': pass2,
      //   'calling_code': countrycode,
      //   'app_country': "ET",
      //   'for_type': "0"
      // });
      // print(response.statusCode);
      // if (response.statusCode == 200 || response.statusCode == 400) {
      //   var jsonResponse = convert.jsonDecode(response.body);
      //   int success = jsonResponse['success'];
      //   String msg = jsonResponse['msg'];
      //   Fluttertoast.showToast(
      //     msg: msg,
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.TOP,
      //     backgroundColor: success == 1 ? Colors.green : Colors.red,
      //     textColor: Colors.white,
      //     timeInSecForIosWeb: 1,
      //     fontSize: 16.0,
      //   );
      // } else {
      //   Fluttertoast.showToast(
      //     msg: "Couldn't connect to the internet",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.TOP,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     timeInSecForIosWeb: 1,
      //     fontSize: 16.0,
      //   );
      // }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> OTP(context, first, last, email, countrycode, mobile,
      pass, newotp, otp) async {
    if (newotp.toString() == otp.toString()) {
      var url = 'https://test.shilengae.com/api/register';
      print("Loading...");
      var response = await http.post(url, body: {
        'email': email.toString(),
        'mobile': mobile.toString(),
        'password': pass.toString(),
        'calling_code': countrycode.toString(),
        'app_country': "ET",
        'first_name': first.toString(),
        'last_name': last.toString(),
        'otp': otp.toString()
      });
      Fluttertoast.showToast(
        msg: "Logged in successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
      // if (response.statusCode == 200 || response.statusCode == 400) {
      //   var jsonResponse = convert.jsonDecode(response.body);
      //   int success = jsonResponse['success'];
      //   String msg = jsonResponse['msg'];
      //   Fluttertoast.showToast(
      //     msg: msg,
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.TOP,
      //     backgroundColor: success == 1 ? Colors.green : Colors.red,
      //     textColor: Colors.white,
      //     timeInSecForIosWeb: 1,
      //     fontSize: 16.0,
      //   );
      // } else {
      //   Fluttertoast.showToast(
      //     msg: "Couldn't connect to the internet",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.TOP,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     timeInSecForIosWeb: 1,
      //     fontSize: 16.0,
      //   );
      // }
    } else {
      Fluttertoast.showToast(
        msg: "OTP code not correct",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
    }
  }
}

// https://test.shilengae.com/api/login?password=12345678&mobile=934252740&calling_code=251&app_country=ET&device_id=1
