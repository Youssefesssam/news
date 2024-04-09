import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/screens/tabs/categories/categoriesTab.dart';
import 'package:news/ui/screens/tabs/news/tabs_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
Category? category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff39a452),
        centerTitle: true,
        elevation: 0,
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80))
        ),
        actions: [
          Image.asset("assets/menu.png"),
          Spacer(),
          const Text(
            "Sports",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.normal),
          ),
          Spacer(),
          Image.asset("assets/search.png")
        ],
      ),

      body: category == null ? CategoriesTab(
          onCategoryClick: onCategoryClick):const TabsList(categoryId:'category.backEndId',)
    );
  }

    void onCategoryClick (Category category){
    print(category.backEndId);
    setState(() {
     this.category =category;
    });

    }
}

