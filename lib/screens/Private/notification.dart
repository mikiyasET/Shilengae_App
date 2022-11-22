import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppNotification extends StatefulWidget {
  @override
  _AppNotificationState createState() => _AppNotificationState();
}

class _AppNotificationState extends State<AppNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Notification",
          style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        backgroundColor:
            Theme.of(context).textSelectionTheme.selectionHandleColor,
        centerTitle: true,
        leading: IconButton(
          icon:
              Icon(Icons.clear, color: Theme.of(context).secondaryHeaderColor),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Text(
              "Clear All",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
