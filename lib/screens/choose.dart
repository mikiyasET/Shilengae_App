import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  // static final FacebookLogin facebookSignIn = new FacebookLogin();

  String _message = "";

  Future<void> _login() async {
    _showMessage('Not Working');
    // final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
    // EasyLoading.show(maskType: EasyLoadingMaskType.black);

    // switch (result.status) {
    //   case FacebookLoginStatus.loggedIn:
    //     final FacebookAccessToken accessToken = result.accessToken;
    //     // _showMessage('''
    //     //  Logged in!
    //
    //     //  Token: ${accessToken.token}
    //     //  User id: ${accessToken.userId}
    //     //  Expires: ${accessToken.expires}
    //     //  Permissions: ${accessToken.permissions}
    //     //  Declined permissions: ${accessToken.declinedPermissions}
    //     //  ''');
    //     print(accessToken.token);
    //     print(accessToken.userId);
    //
    //     var url =
    //         "https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${accessToken.token}";
    //
    //     var graphResponse = await http.get(Uri.parse(url));
    //
    //     var profile = json.decode(graphResponse.body);
    //     final userData = GetStorage();
    //     userData.write('token', accessToken.token);
    //     userData.write('first_name', profile['first_name']);
    //     userData.write('last_name', profile['last_name']);
    //     userData.write('email', profile['email']);
    //     userData.write('socialProfileImage', profile['picture']['data']['url']);
    //     userData.write('loggedIn', true);
    //     EasyLoading.dismiss();
    //
    //     Get.offAllNamed('/home');
    //     // print(profile.toString());
    //     // _showMessage('''
    //     //  Logged in!
    //
    //     //  Token: ${accessToken.token}
    //     //  User id: ${accessToken.userId}
    //     //  Expires: ${accessToken.expires}
    //     //  Permissions: ${accessToken.permissions}
    //     //  Declined permissions: ${accessToken.declinedPermissions}
    //     //  ''');
    //     // Fluttertoast.showToast(
    //     //   msg:
    //     //       "Dear ${profile['picture']} you have Successfully logged in to Facebook",
    //     //   toastLength: Toast.LENGTH_SHORT,
    //     //   gravity: ToastGravity.TOP,
    //     //   backgroundColor: Colors.green,
    //     //   textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
    //     //   timeInSecForIosWeb: 1,
    //     //   fontSize: 16.0,
    //     // );
    //     break;
    //   case FacebookLoginStatus.cancelledByUser:
    //     EasyLoading.dismiss();
    //
    //     Fluttertoast.showToast(
    //       msg: "Login cancelled by the user",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.TOP,
    //       backgroundColor: Colors.blue,
    //       textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
    //       timeInSecForIosWeb: 1,
    //       fontSize: 16.0,
    //     );
    //     // _showMessage('Login cancelled by the user.');
    //     break;
    //   case FacebookLoginStatus.error:
    //     EasyLoading.dismiss();
    //
    //     Fluttertoast.showToast(
    //       msg: "Something went wrong with the login process.",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.TOP,
    //       backgroundColor: Theme.of(context).primaryColor,
    //       textColor: Theme.of(context).textSelectionTheme.selectionHandleColor,
    //       timeInSecForIosWeb: 1,
    //       fontSize: 16.0,
    //     );
    //     // _showMessage('Something went wrong with the login process.\n'
    //     //     'Here\'s the error Facebook gave us: ${result.errorMessage}');
    //     break;
    // }
  }

  // Future<Null> _logOut() async {
  //   await facebookSignIn.logOut();
  //   _showMessage('Logged out.');
  // }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  String country = "Ethiopia";

  String language = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
        backgroundColor: Colors.transparent, // status bar color
        brightness: Brightness.light, // status bar brightness
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 0.0),
                child: Image.asset("logo_fpage".tr),
              ),
              // SizedBox(height: 50),
              InkWell(
                onTap: _login,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xff3E5F97),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 60.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 20, right: 40.0, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            './assets/ic_facebook_logo@3x.png',
                            width: 11,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 10),
                            child: Opacity(
                              opacity: .7,
                              child: VerticalDivider(
                                color: Theme.of(context)
                                    .textSelectionTheme
                                    .selectionHandleColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "connectToFacebook".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textSelectionTheme
                                    .selectionHandleColor,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/login');
                },
                child: Container(
                  alignment: AlignmentDirectional.center,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      )),
                  child: Text(
                    "login".tr,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              SizedBox(height: 50),
              RichText(
                text: TextSpan(
                  text: "newAccount".tr,
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: " "),
                    TextSpan(
                        text: 'register'.tr,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed('/signup'),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 60),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "bySigningup".tr,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: " "),
                    TextSpan(
                        text: 'termsAndCondition'.tr,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => _launchURL2()),
                    TextSpan(text: " "),
                    TextSpan(
                      text: 'and'.tr,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(text: " "),
                    TextSpan(
                        text: 'privacyPolicy'.tr,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => _launchURL()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'http://www.shilengae.com/privacy.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url = 'http://www.shilengae.com/terms-conditions.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
