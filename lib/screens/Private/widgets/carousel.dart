import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  String reason = '';
  final CarouselController _controller = CarouselController();

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        CarouselSlider(
          items: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                    backgroundBlendMode: BlendMode.difference,
                    image: DecorationImage(
                      image: AssetImage('./assets/cover.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Opacity(
                  opacity: .2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                      child: Text(
                        "Get 50% off",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 230,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xffE29B03),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "National Museum of Ethiopia",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Positioned(
                          right: -25,
                          child: Transform.rotate(
                            angle: 3.14 / 2 * 3,
                            child: Icon(
                              Icons.bookmark_sharp,
                              color: Color(0xffE29B03),
                              size: 40,
                            ),
                          ),
                        )
                      ],
                      overflow: Overflow.visible,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 5, bottom: 15.0),
                      child: Text(
                        "Students discount available",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mb',
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                    backgroundBlendMode: BlendMode.difference,
                    image: DecorationImage(
                      image: AssetImage('./assets/cover.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Opacity(
                  opacity: .2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                      child: Text(
                        "Get 50% off",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 230,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xffE29B03),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "National Museum of Ethiopia",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Positioned(
                          right: -25,
                          child: Transform.rotate(
                            angle: 3.14 / 2 * 3,
                            child: Icon(
                              Icons.bookmark_sharp,
                              color: Color(0xffE29B03),
                              size: 40,
                            ),
                          ),
                        )
                      ],
                      overflow: Overflow.visible,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 5, bottom: 15.0),
                      child: Text(
                        "Students discount available",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mb',
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
          options: CarouselOptions(
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 2.0,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: .9,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 7.0,
              height: 7.0,
              margin: EdgeInsets.symmetric(vertical: 18.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == 0
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).dividerColor,
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 7.0,
              height: 7.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == 1
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).dividerColor,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
