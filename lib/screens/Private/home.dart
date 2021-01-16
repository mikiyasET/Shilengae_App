import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userData = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello ${userData.read('first_name')}".tr),
            FlatButton(
              child: Text("Logout".tr),
              color: Theme.of(context).accentColor,
              textColor: Theme.of(context).textSelectionColor,
              onPressed: () async {
                EasyLoading.show(maskType: EasyLoadingMaskType.black);

                final FacebookLogin facebookSignIn = new FacebookLogin();
                await facebookSignIn.logOut();
                userData.erase();
                userData.write('loggedIn', false);
                EasyLoading.dismiss();
                Get.offAllNamed('/fpage');
              },
            )
          ],
        ),
      ),
    );
  }
}
