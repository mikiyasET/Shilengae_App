import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shilingae/blocs/values.dart';
import 'package:shilingae/screens/Private/index.dart';
import 'package:shilingae/screens/Private/location.dart';
import 'package:shilingae/screens/Private/notification.dart';
import 'package:shilingae/screens/Private/postad.dart';
import 'package:shilingae/screens/Private/search.dart';
import 'package:shilingae/screens/Private/settings.dart';
import 'package:shilingae/screens/choose.dart';
import 'package:shilingae/screens/forgot.dart';
import 'package:shilingae/screens/fpage.dart';
import 'package:shilingae/screens/login.dart';
import 'package:shilingae/screens/signup.dart';
import 'package:shilingae/screens/splash_screen.dart';
import 'package:shilingae/services/localizationservice.dart';
import 'package:shilingae/utils/theme.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => SetValues(),
      child: Shilenga(),
    ),
  );
}

class Shilenga extends StatefulWidget {
  @override
  _ShilengaState createState() => _ShilengaState();
}

class _ShilengaState extends State<Shilenga> {
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      theme: basicTheme(),
      darkTheme: darkTheme(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      getPages: [
        GetPage(
          name: '/',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/fpage',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => Fpage(),
        ),
        GetPage(
          name: '/choose',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => Choose(),
        ),
        GetPage(
          name: '/login',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => Login(),
        ),
        GetPage(
          name: '/signup',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => SignUp(),
        ),
        GetPage(
          name: '/forgot',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => ForgetPassword(),
        ),
        GetPage(
          name: '/validate',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => SetValues().GetValue("token") != null ? Fpage() : Login(),
        ),
        // Pravate Pages
        GetPage(
          name: '/home',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => HomePage(),
        ),
        GetPage(
          name: '/settings',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => Settings(),
        ),
        GetPage(
          name: '/postad',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => PostAd(),
        ),
        GetPage(
          name: '/search',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => Searcher(),
        ),
        GetPage(
          name: '/location',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => LocationFinder(),
        ),
        GetPage(
          name: '/notification',
          transition: Transition.cupertino,
          transitionDuration: Duration(seconds: 1),
          page: () => AppNotification(),
        ),
      ],
      builder: EasyLoading.init(),
    );
  }
}
