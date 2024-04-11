
import 'package:flutter/material.dart';


 class Category{
  String backEndId;
  String title;
  String imagePath;
  bool isLeftSided;
  Color backGroundColor;
  Category({
    required this.backEndId,
    required this.title,
    required this.imagePath,
    required this.isLeftSided,
    required this.backGroundColor
  });

  static List<Category> categories = [
    Category(backEndId: "sports", title: "Sports", imagePath:"assets/ball.png", isLeftSided: true, backGroundColor: Colors.red[900]!),
    Category(backEndId: "technology", title: "Technology", imagePath: "assets/Politics.png", isLeftSided: false, backGroundColor: Colors.blue[900]!),
    Category(backEndId: "healthy", title: "Healthy", imagePath: "assets/health.png", isLeftSided: true, backGroundColor: Colors.pink),
    Category(backEndId: "business", title: "Business", imagePath:"assets/bussines.png", isLeftSided: false, backGroundColor:  Color(0xffce7d48)!),
    Category(backEndId: "entertainment", title: "Entertainment", imagePath: "assets/environment.png", isLeftSided: true, backGroundColor: Colors.lightBlue),
    Category(backEndId: "science", title: "Science", imagePath: "assets/science.png", isLeftSided: false, backGroundColor: Color(0xfff0d252)),

  ];




}
