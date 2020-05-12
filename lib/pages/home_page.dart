import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/pages/maker_page.dart';
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
                    return CupertinoPageRoute(
                        settings: settings,
                        builder: (context) =>
                            PhotoDetailsPage(title: "Photo Details"));
                }
              },
              builder: (BuildContext context) {
                return PhotosPage(title: "Photos");
              },
            );
        }
      },
    );
  }
}