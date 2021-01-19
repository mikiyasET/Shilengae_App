import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Widget _settingBuilder({text, icon}) {
    return Container(
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
          Icon(
            Icons.toggle_on_sharp,
            size: 40,
            color: Theme.of(context).primaryColor,
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
          _settingBuilder(text: "Change Password", icon: 1),
          _settingnotiBuilder(text: "Notifications"),
          _settingBuilder(text: "Language", icon: 1),
          _settingBuilder(text: "Change Phone Number", icon: 1),
          _settingBuilder(text: "Change Email Adress", icon: 1),
          _settingBuilder(text: "Term & Condition", icon: 1),
          _settingBuilder(text: "Privacy Policy", icon: 1),
          _settingBuilder(text: "Help & Support", icon: 1),
          _settingBuilder(text: "FAQ", icon: 1),
          _settingBuilder(text: "Contact Us", icon: 1),
          _settingBuilder(text: "Logout", icon: 0),
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
