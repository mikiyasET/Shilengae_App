import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';

class LoginBloc {
  static Future<void> LogIn(code, phone, password) async {
    try {
      String mobile = phone.text;
      String pass = password.text;
      String countrycode = code.toString().substring(1, code.toString().length);
      String number = mobile;
      if ((number[0] + number[1]) == "09") {
        mobile = number.substring(1, number.length);
      } else if (number[0] == "+") {
        mobile = number.substring(countrycode.length + 1, number.length);
      } else if (mobile.startsWith('251', 0)) {
        mobile = number.substring(3, number.length);
      } else {}

      var url = 'https://test.shilengae.com/api/login';

      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      var response = await http.post(url, body: {
        'mobile': mobile,
        'password': pass,
        'calling_code': countrycode,
        'app_country': "ET",
        'device_id': "1"
      });
      EasyLoading.dismiss();
      print(response.statusCode);
      if (mobile.length < 7) {
        Fluttertoast.showToast(
          msg: "Please enter a valid phone number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      }
      if (response.statusCode == 200 || response.statusCode == 400) {
        var jsonResponse = convert.jsonDecode(response.body);
        int success = jsonResponse['success'];
        String msg = jsonResponse['msg'];
        Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: success == 1 ? Colors.green : Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Couldn't connect to the internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}

// https://test.shilengae.com/api/login?password=12345678&mobile=934252740&calling_code=251&app_country=ET&device_id=1
