import 'package:flutter/material.dart';

ThemeData basicTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textSelectionColor: Color(0xffffffff), // white
    primaryColor: Color(0xffE33134), // red
    secondaryHeaderColor: Color(0xff000000), // black
    accentColor: Color(0xff686866), // grey
  );
}

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    textSelectionColor: Color(0xffffffff), // white
    primaryColor: Color(0xffE33134), // red
    secondaryHeaderColor: Color(0xffffffff), // white
    accentColor: Color(0xfff7f7f7), // light
  );
}
