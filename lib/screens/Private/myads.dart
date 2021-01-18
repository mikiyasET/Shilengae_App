import 'package:flutter/material.dart';

class MyAds extends StatefulWidget {
  @override
  _MyAdsState createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "My Ads",
          style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: Container(),
    );
  }
}
