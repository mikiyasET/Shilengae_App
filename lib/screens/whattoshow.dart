import 'package:shared_preferences/shared_preferences.dart';
import 'package:shilingae/screens/fpage.dart';
import 'package:shilingae/screens/login.dart';

Future<dynamic> WhatToShow() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");
  if (token != null) {
    return Fpage();
  } else {
    return Login();
  }
}
