import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shilingae/model/signupmodel.dart';
import 'package:shilingae/screens/Private/widgets/carousel.dart';
import 'package:shilingae/screens/Private/widgets/categories.dart';
import 'package:shilingae/screens/Private/widgets/home_appbar.dart';
import 'package:shilingae/screens/Private/widgets/home_bottom.dart';
import 'package:shilingae/screens/Private/widgets/mcards.dart';
import 'package:shilingae/screens/fpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Categories(),
          Carousel(),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Trending Ads",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                fontSize: 17,
              ),
            ),
          ),
          MCards(),
        ],
      ),

      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [

      //       Text("Hello ${userData.read('first_name')}".tr),
      //       FlatButton(
      //         child: Text("Logout".tr),
      //         color: Theme.of(context).accentColor,
      //         textColor: Theme.of(context).textSelectionColor,
      //         onPressed: () async {
      //           EasyLoading.show(maskType: EasyLoadingMaskType.black);

      //           final FacebookLogin facebookSignIn = new FacebookLogin();
      //           await facebookSignIn.logOut();
      //           userData.erase();
      //           userData.write('loggedIn', false);
      //           EasyLoading.dismiss();
      //           Get.offAllNamed('/fpage');
      //         },
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
