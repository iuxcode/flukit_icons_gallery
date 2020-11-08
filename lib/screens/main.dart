import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_unicons/flutter_unicons.dart';
import 'package:flutter_unicons_gallery/configs/theme.dart';
import 'package:flutter_unicons_gallery/screens/documentation.dart';
import 'package:flutter_unicons_gallery/screens/icons.dart';
import 'package:flutter_unicons_gallery/screens/index.dart';
import 'package:flutter_unicons_gallery/widgets/bottomNavigation.dart';

List<Widget> pages = [
  HomeScreen(),
  DocumentationScreen(),
  IconsScreen()
];

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: pages.length,vsync: this);
  }
  @override
  Widget build(BuildContext context){  
    ScreenUtil.init(context);
    return AnnotatedRegion(
      value: systemStyle,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: TabBarView(
                controller: tabController,
                physics: NeverScrollableScrollPhysics(),
                children: pages.map((e) => e).toList()
              )),
              NavigationBar(
                onChange: (val){
                  tabController.animateTo(
                    val,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear
                  );
                },
                height: 65,
                indicatorSize: 4,
                items: [
                  NavigationBarItem(UniconData.uniHouseUser, UniconData.uniHouseUserMonochrome),
                  NavigationBarItem(UniconData.uniDocumentLayoutLeft, UniconData.uniDocumentLayoutLeftMonochrome),
                  NavigationBarItem(UniconData.uniLayerGroup, UniconData.uniLayerGroupMonochrome)
                ]
              )
            ],
          )
        )
      )
    );
  }
}