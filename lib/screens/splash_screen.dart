import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shilingae/screens/fpage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/validate');

    //      Consumer<String>(
    //   builder: (context, data, child) {
    //     return null;
    //   },
    // );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).textSelectionColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset("assets/splash_screen_android.png"),
            ),
            // Padding(padding: EdgeInsets.only(top: 20.0)),
            // Text(
            //   "Splash Screen",
            //   style: TextStyle(
            //       fontSize: 20.0,
            //       color: Theme.of(context).textSelectionColor
            //   ),
            // ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              strokeWidth: 1,
              valueColor: new AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
