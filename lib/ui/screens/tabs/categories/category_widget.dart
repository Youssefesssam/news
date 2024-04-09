import 'package:flutter/material.dart';

import '../../../../model/category.dart';

class AppCategory extends StatelessWidget {
  final Category category;

  const AppCategory({required this.category});

  final radius = const Radius.circular(24);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: category.backGroundColor,
            borderRadius: BorderRadius.only(
                topRight: radius,
                topLeft: radius,
                bottomLeft: category.isLeftSided ? Radius.zero : radius,
                bottomRight: !category.isLeftSided ? Radius.zero : radius)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(category.imagePath,
              height: MediaQuery.of(context).size.height * .15),
          Text(category.title,
              style: TextStyle(
                color: Colors.white,
              )),
        ]));
  }
}
