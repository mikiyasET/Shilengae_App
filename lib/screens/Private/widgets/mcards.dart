import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: GridView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: <Widget>[
          Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image.asset(
                      "./assets/cover.jpg",
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "5,948,000 ብር",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Mb',
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Ranch Style House",
                  style:
                      TextStyle(fontFamily: 'Mb', fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 15,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 17.0,
                              color: Colors.grey,
                            ),
                            Text(
                              "Addis Ababa, Addis Ababa",
                              style: TextStyle(
                                  fontFamily: 'Mb',
                                  fontSize: 14.0,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image.asset(
                      "./assets/cover.jpg",
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "5,948,000 ብር",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Mb',
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Ranch Style House",
                  style:
                      TextStyle(fontFamily: 'Mb', fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 15,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 17.0,
                              color: Colors.grey,
                            ),
                            Text(
                              "Addis Ababa, Addis Ababa",
                              style: TextStyle(
                                  fontFamily: 'Mb',
                                  fontSize: 14.0,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image.asset(
                      "./assets/cover.jpg",
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "5,948,000 ብር",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Mb',
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Ranch Style House",
                  style:
                      TextStyle(fontFamily: 'Mb', fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 15,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 17.0,
                              color: Colors.grey,
                            ),
                            Text(
                              "Addis Ababa, Addis Ababa",
                              style: TextStyle(
                                  fontFamily: 'Mb',
                                  fontSize: 14.0,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image.asset(
                      "./assets/cover.jpg",
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "5,948,000 ብር",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Mb',
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Ranch Style House",
                  style:
                      TextStyle(fontFamily: 'Mb', fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 15,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 17.0,
                              color: Colors.grey,
                            ),
                            Text(
                              "Addis Ababa, Addis Ababa",
                              style: TextStyle(
                                  fontFamily: 'Mb',
                                  fontSize: 14.0,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image.asset(
                      "./assets/cover.jpg",
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "5,948,000 ብር",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Mb',
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Ranch Style House",
                  style:
                      TextStyle(fontFamily: 'Mb', fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 15,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 17.0,
                              color: Colors.grey,
                            ),
                            Text(
                              "Addis Ababa, Addis Ababa",
                              style: TextStyle(
                                  fontFamily: 'Mb',
                                  fontSize: 14.0,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image.asset(
                      "./assets/cover.jpg",
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "5,948,000 ብር",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Mb',
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Ranch Style House",
                  style:
                      TextStyle(fontFamily: 'Mb', fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 15,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 17.0,
                              color: Colors.grey,
                            ),
                            Text(
                              "Addis Ababa, Addis Ababa",
                              style: TextStyle(
                                  fontFamily: 'Mb',
                                  fontSize: 14.0,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image.asset(
                      "./assets/cover.jpg",
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "5,948,000 ብር",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Mb',
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Ranch Style House",
                  style:
                      TextStyle(fontFamily: 'Mb', fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 15,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 17.0,
                              color: Colors.grey,
                            ),
                            Text(
                              "Addis Ababa, Addis Ababa",
                              style: TextStyle(
                                  fontFamily: 'Mb',
                                  fontSize: 14.0,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image.asset(
                      "./assets/cover.jpg",
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "5,948,000 ብር",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Mb',
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Ranch Style House",
                  style:
                      TextStyle(fontFamily: 'Mb', fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 15,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 17.0,
                              color: Colors.grey,
                            ),
                            Text(
                              "Addis Ababa, Addis Ababa",
                              style: TextStyle(
                                  fontFamily: 'Mb',
                                  fontSize: 14.0,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
