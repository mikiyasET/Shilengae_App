import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shilingae/screens/Private/chat.dart';
import 'package:shilingae/screens/Private/home.dart';
import 'package:shilingae/screens/Private/myads.dart';
import 'package:shilingae/screens/Private/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Home(),
    Chat(),
    MyAds(),
    Profile(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home(); // Our first view in viewport
  final userData = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 12),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Home(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          currentTab == 0
                              ? "./assets/icons/ic_home_active_red@3x.png"
                              : "./assets/icons/ic_home_inactive@3x.png",
                          width: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 10.5,
                                color: currentTab == 0
                                    ? Theme.of(context).primaryColor
                                    : Color(0xffc0c0c0),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Chat(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          currentTab == 1
                              ? "./assets/icons/ic_chat_active_red@3x.png"
                              : "./assets/icons/ic_chat_inactive@3x.png",
                          width: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            "Chat",
                            style: TextStyle(
                                fontSize: 10.5,
                                color: currentTab == 1
                                    ? Theme.of(context).primaryColor
                                    : Color(0xffc0c0c0),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // Right Tab bar icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            MyAds(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          currentTab == 2
                              ? "./assets/icons/ic_ads_active_red@3x.png"
                              : "./assets/icons/ic_ads_inactive@3x.png",
                          width: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            "My Ads",
                            style: TextStyle(
                                fontSize: 10.5,
                                color: currentTab == 2
                                    ? Theme.of(context).primaryColor
                                    : Color(0xffc0c0c0),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () async {
                      // EasyLoading.show(maskType: EasyLoadingMaskType.black);
                      // final FacebookLogin facebookSignIn = new FacebookLogin();
                      // await facebookSignIn.logOut();
                      setState(() {
                        // userData.erase();
                        // userData.write('loggedIn', false);
                        // EasyLoading.dismiss();
                        // Get.offAllNamed('/fpage');
                        currentScreen =
                            Profile(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          currentTab == 3
                              ? "./assets/icons/ic_profile_active_red@3x.png"
                              : "./assets/icons/ic_profile_inactive@3x.png",
                          width: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 10.5,
                                color: currentTab == 3
                                    ? Theme.of(context).primaryColor
                                    : Color(0xffc0c0c0),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
