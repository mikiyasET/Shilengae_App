import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ForgotBloc {
  static Future<void> password(context, phone, code) async {
    try {
      String mobile = phone.text;
      String countrycode = code.toString().substring(1, code.toString().length);
      String number = mobile;
      if ((number[0] + number[1]) == "09") {
        mobile = number.substring(1, number.length);
      } else if (number[0] == "+") {
        mobile = number.substring(countrycode.length + 1, number.length);
      } else if (mobile.startsWith('251', 0)) {
        mobile = number.substring(3, number.length);
      }
      var otp_url = 'https://test.shilengae.com/api/forgot_password';
      var res = await http
          .post(otp_url, body: {'mobile': mobile, 'calling_code': countrycode});
      if (res.statusCode == 200 || res.statusCode == 400) {
        var jr = convert.jsonDecode(res.body);
        if (jr['successs'] == 1) {
          Fluttertoast.showToast(
            msg: jr['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            timeInSecForIosWeb: 1,
            fontSize: 16.0,
          );
        } else {
          Fluttertoast.showToast(
            msg: jr['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            timeInSecForIosWeb: 1,
            fontSize: 16.0,
          );
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Unexpected Error!" + e.toString(),
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
