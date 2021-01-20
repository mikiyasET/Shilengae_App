import 'package:flutter/material.dart';

class PostAd extends StatefulWidget {
  @override
  _PostAdState createState() => _PostAdState();
}

class _PostAdState extends State<PostAd> {
  double _cardsElevation = 4;
  @override
  Widget build(BuildContext context) {
    Widget _CardBuilder({type = "none", icons, name, icons2, name2}) {
      return type == "row"
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: _cardsElevation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 30),
                    child: Column(
                      children: [
                        Image.asset(
                          "./assets/$icons",
                          width: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          name,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: _cardsElevation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 30),
                    child: Column(
                      children: [
                        Image.asset(
                          "./assets/$icons2",
                          width: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          name2,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Card(
              elevation: _cardsElevation,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.375,
                    vertical: 30),
                child: Column(
                  children: [
                    Image.asset(
                      "./assets/$icons",
                      width: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            );
    }

    Widget _AllCards() {
      return Column(
        children: [
          _CardBuilder(
              type: 'row',
              icons: "11.png",
              name: "Motors",
              icons2: "22.png",
              name2: "Classifieds"),
          _CardBuilder(
            icons: "33.png",
            name: "Property",
          ),
          _CardBuilder(
              type: 'row',
              icons: "44.png",
              name: "Jobs",
              icons2: "55.png",
              name2: "Community"),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    "./assets/icons/ic_big_cross_red@3x.png",
                    width: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 57, right: 57, bottom: 20.0),
                    child: Text(
                      "SELECT THE CATEGORY RELEVANT TO YOUR AD",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 25),
              child: _AllCards(),
            )
          ],
        ),
      ),
    );
  }
}
