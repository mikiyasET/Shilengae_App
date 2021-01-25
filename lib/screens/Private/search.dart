import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searcher extends StatefulWidget {
  @override
  _SearcherState createState() => _SearcherState();
}

class _SearcherState extends State<Searcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Search ads",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Image.asset(
              "./assets/icons/ic_list_view@3x.png",
              width: 25,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              "./assets/icons/ic_grid_view@3x.png",
              width: 25,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              "./assets/icons/ic_filter@3x.png",
              width: 25,
            ),
            onPressed: () {},
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, bottom: 10.0, top: 10.0),
            child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: TextField(
                onTap: () {
                  print("hello");
                  Get.toNamed("/search");
                },
                readOnly: false,
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.search, color: Colors.grey[400], size: 22),
                  hintText: 'Search here...',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: Colors.grey[500],
                    fontFamily: 'Mb',
                  ),
                  prefixStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.grey,
                      size: 19,
                    ),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
