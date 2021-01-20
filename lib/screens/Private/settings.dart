import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shilingae/screens/Private/changer.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _switchval = true;
  Widget _settingBuilder({text, icon, type = 0, page}) {
    return GestureDetector(
      onTap: () {
        type == 0
            ? Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ChangeEveryThing(title: text, page: page);
              }))
            : showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => AlertDialog(
                  titlePadding: EdgeInsets.only(left: 15.0, top: 20.0),
                  contentPadding:
                      EdgeInsets.only(left: 15.0, top: 10, bottom: 20),
                  title: Text("Logout"),
                  content: Text(
                    "Are you sure you want to logout?",
                    style: TextStyle(fontSize: 15.6),
                  ),
                  actions: [
                    FlatButton(
                      child: Text("CANCLE"),
                      textColor: Colors.black,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    FlatButton(
                      child: Text("LOGOUT"),
                      textColor: Colors.black,
                      onPressed: () async {
                        final userData = GetStorage();
                        EasyLoading.show(maskType: EasyLoadingMaskType.black);
                        final FacebookLogin facebookSignIn =
                            new FacebookLogin();
                        await facebookSignIn.logOut();
                        userData.erase();
                        userData.write('loggedIn', false);
                        EasyLoading.dismiss();
                        Get.offAndToNamed('/fpage');
                      },
                    ),
                  ],
                ),
              );
        // Get.defaultDialog(
        //   title: "Logout",

        //   content: Text("Are you sure you want to logout?"),
        //   actions: [
        //     Text("CANCEL"),
        //     Text("LOGOUT"),
        //   ],
        //   barrierDismissible: true,
        // );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        )),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            icon == 1 ? Icon(Icons.navigate_next) : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _settingnotiBuilder({
    text,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor,
        ),
      )),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          Switch(
            value: _switchval,
            onChanged: (val) {
              setState(() {
                _switchval = !_switchval;
              });
            },
            activeColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }

  Widget _settingslist() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _settingBuilder(text: "Change Password", icon: 1, page: 1),
          _settingnotiBuilder(text: "Notifications"),
          _settingBuilder(text: "Language", icon: 1, page: 3),
          _settingBuilder(text: "Change Phone Number", icon: 1, page: 4),
          _settingBuilder(text: "Change Email Adress", icon: 1, page: 5),
          _settingBuilder(text: "Term & Condition", icon: 1, page: 6),
          _settingBuilder(text: "Privacy Policy", icon: 1, page: 7),
          _settingBuilder(text: "Help & Support", icon: 1, page: 8),
          _settingBuilder(text: "FAQ", icon: 1, page: 9),
          _settingBuilder(text: "Contact Us", icon: 1, page: 10),
          _settingBuilder(text: "Logout", icon: 0, type: 1),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Settings",
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor)),
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: _settingslist()),
    );
  }
}
