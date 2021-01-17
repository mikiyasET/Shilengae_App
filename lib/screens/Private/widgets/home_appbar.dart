import 'package:flutter/material.dart';

Widget HomeAppBar() {
  List<DropdownMenuItem<int>> mklistDrop = [];

  void loadData() {
    mklistDrop.add(
      DropdownMenuItem(
        child: Text('City'),
        value: 1,
      ),
    );
    mklistDrop.add(
      DropdownMenuItem(
        child: Text('City'),
        value: 2,
      ),
    );
  }

  return AppBar(
    toolbarHeight: 120.0,
    elevation: 0.0,
    title: Stack(
      overflow: Overflow.visible,
      children: [
        Container(),
        Positioned(
          top: -15.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Container(),
                  Positioned(
                    top: -5.0,
                    child: Text(
                      "Location",
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  elevation: 0,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  style: TextStyle(color: Colors.black),
                  hint: Text(
                    "A3, Addis Ababa, Ethiopia",
                    style: TextStyle(color: Colors.white),
                  ),
                  items: mklistDrop,
                  onChanged: (value) => print("You have selected $value"),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
        ),
      ),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, bottom: 10.0, top: 0.0),
        child: Container(
          height: 45.0,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 22),
              hintText: 'What are you looking for?',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.grey[600],
                fontFamily: 'Mb',
              ),
              prefixStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
    ),
    backgroundColor: Color(0xffE43134),
  );
}
