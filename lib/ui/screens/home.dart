import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/screens/settings/settingsTab.dart';
import 'package:news/ui/screens/tabs/categories/categoriesTab.dart';
import 'package:news/ui/screens/tabs/news/tabs_list.dart';
import 'package:news/ui/screens/tabs/searshBar/searshBar.dart';
import 'package:news/ui/widets/app_loclization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget body;

  @override
  void initState() {
    super.initState();
    body = CategoriesTab(onCategoryClick: onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (body is CategoriesTab) {
          return true;
        } else {
          setState(() {
            body == CategoriesTab(onCategoryClick: onCategoryClick);
          });

          return false;
        }
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/backGround.jpg"),fit: BoxFit.cover
            )
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff39a452),
            centerTitle: true,
            elevation: 0,
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100))),
            actions: [
              const SizedBox(
                width: 120,
              ),
              Center(
                child: Text(
                  context.l10n(context).newsApp,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    showSearch(
                        context: context, delegate: CustomSearchDelegate());
                  },
                  child: Image.asset("assets/search.png"))
            ],
          ),
          drawer: buildDrawer(),
          body: body,backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .15,
            width: MediaQuery.sizeOf(context).width,
            color: const Color(0xff39a352),
            child: Center(
                child: Text(
              context.l10n(context).newsApp,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDrawerListItem(Icons.list, context.l10n(context).category,
                    () {
                  setState(() {
                    body = CategoriesTab(onCategoryClick: onCategoryClick);
                    Navigator.pop(context);
                  });
                }),
                buildDrawerListItem(
                    Icons.settings, context.l10n(context).setting, () {
                  setState(() {
                    body = const SettingsTab();
                    Navigator.pop(context);
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildDrawerListItem(IconData icon, String data, Function onClick) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              data,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }

  void onCategoryClick(Category category) {
    setState(() {
      body = TabsList(categoryId: category.backEndId);
    });
  }
}

