import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      height: 70.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Category(
              file: '1.png',
              label: 'Motors',
            ),
            Category(file: '2.png', label: 'Classifieds'),
            Category(file: '3.png', label: 'Property'),
            Category(file: '4.png', label: 'Jobs'),
            Category(file: '5.png', label: 'Community'),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String file;
  final String label;

  Category({required this.file, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          './assets/$file',
          width: 30.0,
          height: 45.0,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10.0),
        )
      ],
    );
  }
}
