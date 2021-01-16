import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

Widget HomeBottomBar() {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  return CurvedNavigationBar(
    key: _bottomNavigationKey,
    index: 2,
    height: 55.0,
    items: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "./assets/icons/ic_home_inactive@3x.png",
            width: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Text(
              "Home",
              style: TextStyle(fontSize: 9.0, color: Color(0xffc0c0c0)),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "./assets/icons/ic_chat_inactive@3x.png",
            width: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Text(
              "Chat",
              style: TextStyle(fontSize: 9.0, color: Color(0xffc0c0c0)),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(2.0),
            width: 40.0,
            height: 40.0,
            child: Column(
              children: [
                Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.white,
                ),
                Text(
                  "Post ad",
                  style: TextStyle(
                    fontSize: 9.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "./assets/icons/ic_ads_inactive@3x.png",
            width: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Text(
              "My Ads",
              style: TextStyle(fontSize: 9.0, color: Color(0xffc0c0c0)),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "./assets/icons/ic_profile_inactive@3x.png",
            width: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 9.0, color: Color(0xffc0c0c0)),
            ),
          ),
        ],
      ),
    ],
    color: Colors.white,
    buttonBackgroundColor: Colors.red,
    backgroundColor: Colors.transparent,
    animationCurve: Curves.easeInOut,
    animationDuration: Duration(milliseconds: 600),
    onTap: (index) {
      // setState(() {
      //   _page = index;
      // });
    },
    letIndexChange: (index) => true,
  );
}
