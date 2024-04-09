
import 'package:flutter/material.dart';
import 'package:news/data/api_manegar.dart';
import 'package:news/model/sources.dart';
import 'package:news/ui/screens/tabs/news/tabs_details.dart';

import '../../../widets/app_error.dart';
import '../../../widets/app_loader.dart';

class TabsList extends StatefulWidget {
  const TabsList({super.key});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  int currentTabIndex=0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.loadList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return AppError( error: snapshot.error.toString(),);
          } else if (snapshot.hasData) {
            return tabsList(snapshot.data!.sources!);
          } else {
            return Center(child: AppLaoder());
          }
        });
  }
  Widget tabsList(List<Source> sources) {
    List<Widget> tabsWidgetList = [];
    for (var source in sources) {
      tabsWidgetList.add(tabWidget(source,true));
    }
    return  DefaultTabController(
      length:sources.length,
      child: Column(
        children: [
          TabBar(
            tabs: sources.map((source)=>tabWidget(source, currentTabIndex == sources.indexOf(source) )).toList(),
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: (newTabIndex){
              setState(() {
                currentTabIndex = newTabIndex;
              });

            },
          ),

          Expanded(
              child: TabBarView(
                children: sources.map((source){
                  return  TabDetails(sourceId: source.id,);
                }).toList(),
              ),
            ),

        ],
      ),
    );
  }


  Widget tabWidget(Source source,bool isSlected){
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical:8 ),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff39a352),width: 1),
          borderRadius: BorderRadius.circular(18),
          color: isSlected ? Color(0xff39a352):Colors.transparent
      ),
      child: Text(source.name,style: TextStyle(
          color: isSlected ? Colors.white:Color(0xff39a352) ),
      ),
    );

  }

}







