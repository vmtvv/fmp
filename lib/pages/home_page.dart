import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/pages/definition_page.dart';
import 'package:fmp/pages/info_page.dart';
import 'package:fmp/pages/instruction_page.dart';
import 'package:fmp/pages/maker_page.dart';
import 'package:fmp/pages/map_page.dart';
import 'package:fmp/pages/photos_page.dart';
import 'package:fmp/routes/app_routes.dart';
import 'photo_details_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Maker"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            title: Text("Photos"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text("Info"),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return MakerPage(title: "Maker");
              },
            );
          case 1:
            return CupertinoTabView(
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case AppRoutes.photoDetails:
                    return CupertinoPageRoute(builder: (context) => PhotoDetailsPage(title: "Photo Details"));
                }
              },
              builder: (BuildContext context) {
                return PhotosPage(title: "Photos");
              },
            );
          case 2:
            return CupertinoTabView(
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case AppRoutes.definition:
                    return CupertinoPageRoute(builder: (context) => DefinitionPage(title: "Definition"));
                  case AppRoutes.map:
                    return CupertinoPageRoute(builder: (context) => MapPage(title: "Rainbow Locator"));
                  case AppRoutes.instruction:
                    return CupertinoPageRoute(builder: (context) => InstructionPage(title: "Instruction"));
                }
              },
              builder: (BuildContext context) {
                return InfoPage(title: "Info");
              },
            );
        }
      },
    );
  }
}
