import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shilingae/screens/choose.dart';
import 'package:shilingae/screens/error.dart';
import 'package:shilingae/screens/forgot.dart';
import 'package:shilingae/screens/fpage.dart';
import 'package:shilingae/screens/login.dart';
import 'package:shilingae/screens/signup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shilingae/screens/splash_screen.dart';
import 'package:shilingae/utils/theme.dart';

// popup message localization tobe done

void main() {
  runApp(EasyLocalization(
    path: "resources/langs",
    child: Shilenga(),
    saveLocale: true,
    supportedLocales: [
      Locale('en', 'EN'),
      Locale('am', 'AM'),
    ],
  ));
}

class Shilenga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.ring
      // ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 25.0
      ..fontSize = 0.4
      ..radius = 10.0
      ..textColor = Colors.white
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Colors.white
      ..textColor = Colors.yellow
      ..userInteractions = false
      ..dismissOnTap = false;

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme(),
      // theme: ThemeData(
      //   primaryColor: Color(0xffE33134),
      //   secondaryHeaderColor: Color(0xffD8D8D8),
      //   backgroundColor: Color(0xffE33134),
      //   scaffoldBackgroundColor: Theme.of(context).textSelectionColor,
      //   textTheme: TextTheme(
      //     headline1: TextStyle(color: Color(0xffAFAFAF)), // Gray Color
      //     headline2: TextStyle(color: Color(0xffFFFFFF)), // Pure White
      //     headline3: TextStyle(color: Color(0xffE33134)), // Red Color
      //     headline4: TextStyle(color: Color(0xffAFAFAF)), // Gray Color
      //     headline5: TextStyle(color: Color(0xffFFFFFF)), // Pure White
      //     headline6: TextStyle(color: Color(0xff3E5F97)), // Blue Color
      //     bodyText1: TextStyle(color: Color(0xff3E5F97)), // Blue Color
      //     bodyText2: TextStyle(color: Color(0xff000000)), // Blue Color
      //   ),
      // ),
      theme: basicTheme(),
      title: 'Shilenga', // Title of the app
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          // routing
          return MaterialPageRoute(builder: (context) => SplashScreen());
        } else if (settings.name == '/Fpage') {
          return MaterialPageRoute(builder: (context) => Fpage());
        } else if (settings.name == '/choose') {
          return MaterialPageRoute(builder: (context) => Choose());
        } else if (settings.name == '/login') {
          return MaterialPageRoute(builder: (context) => Login());
        } else if (settings.name == '/signup') {
          return MaterialPageRoute(builder: (context) => SignUp());
        } else if (settings.name == '/forgot') {
          return MaterialPageRoute(builder: (context) => ForgetPassword());
        }

        return MaterialPageRoute(builder: (context) => UnknownScreen());
      },
      builder: EasyLoading.init(),
    );
  }
}
