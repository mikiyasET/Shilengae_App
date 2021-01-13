import 'package:flutter/material.dart';

ThemeData basicTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textSelectionColor: Color(0xffffffff),
    primaryColor: Color(0xffE33134), // red
    secondaryHeaderColor: Color(0xff000000), // black
    accentColor: Color(0xff686866), // grey
  );
}
