import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shilingae/screens/otppage.dart';
import 'package:shilingae/utils/links.dart';

class SignupBloc {
  static Future<void> SignUp(
      context, first, last, emailad, code, phone, password1, password2) async {
    try {
      String firstName = first.text;
      String? lastName = last.text;

      String? email = emailad.text;
      String? mobile = phone.text;
      String? pass1 = password1.text;
      String? pass2 = password2.text;

      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      if (firstName.length < 2) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
          msg: "First Name should be atleast 2 characters long",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else if (lastName!.length < 2) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
          msg: "Last Name should be atleast 2 characters long",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else if (!RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email!)) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
          msg: "Please enter a valid email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{7,12}$)').hasMatch(mobile!)) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
          msg: "Please enter a valid Mobile Number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else if (pass1!.length < 6 ||
          pass1.length > 15 ||
          pass2!.length < 6 ||
          pass2.length > 15) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
          msg: "Password can contain minimum of 6 and maximum of 15 characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else if (pass1 != pass2) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
          msg: "Passwords don't match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else {
        try {
          // EasyLoading.dismiss();
          // print("hello");
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
          var otp_url = '${testUrl + requestOTP}';
          print("been 1");
          var res = await http.post(Uri.parse(otp_url), body: {
            'email': email,
            'mobile': mobile,
            'password': pass2,
            'calling_code': countrycode,
            'app_country': "ET",
            'for_type': "1"
          });
          print("been 1");
          var jr = convert.jsonDecode(res.body);
          print(res.statusCode);
          if (res.statusCode == 200 || res.statusCode == 400) {
            if (jr['success'] == 1) {
              EasyLoading.dismiss();
              Get.to(
                otpPage(
                  firstname: firstName,
                  lastname: lastName,
                  otp: jr['otp'],
                  email: email,
                  mobile: mobile,
                  password: pass2,
                  calling_code: countrycode,
                  app_country: "ET",
                  for_type: "1",
                ),
              );
            } else {
              EasyLoading.dismiss();
              Fluttertoast.showToast(
                msg: jr['msg'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                backgroundColor: Theme.of(context).primaryColor,
                textColor:
                    Theme.of(context).textSelectionTheme.selectionHandleColor,
                timeInSecForIosWeb: 1,
                fontSize: 16.0,
              );
            }
            print(res.body);
          } else {
            EasyLoading.dismiss();
            Fluttertoast.showToast(
              msg: jr['msg'].toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: Theme.of(context).primaryColor,
              textColor:
                  Theme.of(context).textSelectionTheme.selectionHandleColor,
              timeInSecForIosWeb: 1,
              fontSize: 16.0,
            );
          }
        } catch (e) {
          EasyLoading.dismiss();
          Fluttertoast.showToast(
            msg: "Please try later",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: Theme.of(context).primaryColor,
            textColor:
                Theme.of(context).textSelectionTheme.selectionHandleColor,
            timeInSecForIosWeb: 1,
            fontSize: 16.0,
          );
        }
      }

      // var url2 = '${testUrl + requestOTP}';
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
      //     backgroundColor: success == 1 ? Colors.green : Theme.of(context).primaryColor,
      //     textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
      //     timeInSecForIosWeb: 1,
      //     fontSize: 16.0,
      //   );
      // } else {
      //   Fluttertoast.showToast(
      //     msg: "Couldn't connect to the internet",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.TOP,
      //     backgroundColor: Theme.of(context).primaryColor,
      //     textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
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
    try {
      if (newotp.toString() == otp.toString()) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);

        var url = '${testUrl + register}';
        print("Loading...");
        var response = await http.post(Uri.parse(url), body: {
          'email': email.toString(),
          'mobile': mobile.toString(),
          'password': pass.toString(),
          'calling_code': countrycode.toString(),
          'app_country': "ET",
          'first_name': first.toString(),
          'last_name': last.toString(),
          'otp': otp.toString()
        });
        // Fluttertoast.showToast(
        //   msg: "Logged in successfully",
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.TOP,
        //   backgroundColor: Colors.green,
        //   textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
        //   timeInSecForIosWeb: 1,
        //   fontSize: 16.0,
        // );
        Map<String, dynamic>? jsonResponse = convert.jsonDecode(response.body);

        if (response.statusCode == 200 || response.statusCode == 400) {
          int? success = jsonResponse!['success'];
          String? msg = jsonResponse['msg'];
          EasyLoading.dismiss();
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
            Get.offAllNamed('/home');
          } else {
            Fluttertoast.showToast(
              msg: msg!,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: Theme.of(context).primaryColor,
              textColor:
                  Theme.of(context).textSelectionTheme.selectionHandleColor,
              timeInSecForIosWeb: 1,
              fontSize: 16.0,
            );
          }
        } else {
          EasyLoading.dismiss();
          Fluttertoast.showToast(
            msg: jsonResponse!['msg'].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: Theme.of(context).primaryColor,
            textColor:
                Theme.of(context).textSelectionTheme.selectionHandleColor,
            timeInSecForIosWeb: 1,
            fontSize: 16.0,
          );
        }
      } else {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
          msg: "OTP code not correct",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }
}

// ${testUrl}login?password=12345678&mobile=934252740&calling_code=251&app_country=ET&device_id=1
