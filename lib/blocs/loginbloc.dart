import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';

class LoginBloc {
  static Future<void> LogIn(code, phone, password) async {
    try {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      print("1");
      String mobile = phone.text.toString();
      print("2");
      String pass = password.text.toString();
      print("3");
      String countrycode = code.toString().substring(1, code.toString().length);
      print("4");
      String number = mobile..toString();
      print("5");
      if (mobile.length < 7) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
          msg: "Please enter a valid phone number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else if (password.length < 6) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
          msg: "Password Must be 6 character long",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else {
        if ((number[0] + number[1]) == "09") {
          print("7");

          mobile = number.substring(1, number.length);
        } else if (number[0] == "+") {
          print("8");

          mobile = number.substring(countrycode.length + 1, number.length);
        } else if (mobile.startsWith('251', 0)) {
          print("9");

          mobile = number.substring(3, number.length);
        } else {
          print("10");
        }
        print("11");
        var url = 'https://test.shilengae.com/api/login';
        if (mobile.length < 7) {
          EasyLoading.dismiss();
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
        var response = await http.post(url, body: {
          'mobile': mobile,
          'password': pass,
          'calling_code': countrycode,
          'app_country': "ET",
          'device_id': "1"
        });

        if (response.statusCode == 200 || response.statusCode == 400) {
          var jsonResponse = convert.jsonDecode(response.body);
          int success = jsonResponse['success'];
          String msg = jsonResponse['msg'];

          if (success == 1) {
            final users = jsonResponse['user'];
            final userData = GetStorage();
            userData.write("token", jsonResponse['token']);
            userData.write("groupId", users['group_id']);
            userData.write("firstName", users['first_name']);
            userData.write("lastName", users['last_name']);
            userData.write("name", users['name']);
            userData.write("profileImage", users['profile_image']);
            userData.write("socialProfileImage", users['social_profile_image']);
            userData.write("mobile", users['mobile']);
            userData.write("callingCode", users['calling_code']);
            userData.write("email", users['email']);
            userData.write("gender", users['gender']);
            userData.write("dob", users['dob']);
            userData.write("pcode", users['pcode']);
            userData.write("clevel", users['clevel']);
            userData.write("cposition", users['cposition']);
            userData.write("salary", users['salary']);
            userData.write("resume", users['resume']);
            userData.write("rsize", users['rsize']);
            userData.write("provider", users['provider']);
            userData.write("providerId", users['provider_id']);
            userData.write("description", users['description']);
            userData.write("business", users['business']);
            userData.write("industry", users['industry']);
            userData.write("userCity", users['user_city']);
            userData.write("userState", users['user_state']);
            userData.write("userCountry", users['user_country']);
            userData.write("appCountry", users['app_country']);
            userData.write("language", users['language']);
            userData.write("showname", users['showname']);
            userData.write("fcmId", users['fcm_id']);
            userData.write("accountStatus", users['account_status']);
            userData.write("forgotStatus", users['forgot_status']);
            userData.write("emailVerifiedAt", users['email_verified_at']);
            userData.write("verified", users['verified']);
            userData.write("mverified", users['mverified']);
            userData.write("deviceType", users['device_type']);
            userData.write("educationLevel", users['education_level']);
            userData.write("experience", users['experience']);
            userData.write("salaryExpectation", users['salary_expectation']);
            userData.write("officeAddress", users['office_address']);
            userData.write("noOfEmployees", users['no_of_employees']);
            userData.write("since", users['since']);
            userData.write("vat", users['vat']);
            userData.write("useOfApp", users['use_of_app']);
            userData.write("createdAt", users['created_at']);
            userData.write("updatedAt", users['updated_at']);
            userData.write("loggedIn", true);
            EasyLoading.dismiss();
            Get.offAllNamed('/home');
          } else {
            EasyLoading.dismiss();
            Fluttertoast.showToast(
              msg: msg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: success == 1 ? Colors.green : Colors.red,
              textColor: Colors.white,
              timeInSecForIosWeb: 1,
              fontSize: 16.0,
            );
          }
        } else {
          EasyLoading.dismiss();
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
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
      Fluttertoast.showToast(
        msg: "Please try again later" + e.toString(),
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
