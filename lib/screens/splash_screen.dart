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
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Fpage()
    )
    );
  }

  initScreen(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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
            //       color: Colors.white
            //   ),
            // ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.black,
              strokeWidth: 1,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
            )
          ],
        ),
      ),
    );
  }
}