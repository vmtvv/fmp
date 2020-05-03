import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/pages/photos_page.dart';
import 'package:fmp/routes/app_routes.dart';
import 'package:fmp/pages/details_page.dart';
import 'package:fmp/pages/home_page.dart';
import 'package:fmp/routes/rotation_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      initialRoute: AppRoutes.home,
      onGenerateRoute: (settings) {
        switch (settings.name){
          case AppRoutes.home:
            return CupertinoPageRoute(builder: (context) => HomePage(title: "Rainbow Maker"));
          case AppRoutes.details:
            return RotationRoute(page: DetailsPage(title: "Details"));
          case AppRoutes.photos:
            return CupertinoPageRoute(builder: (context) => PhotosPage(title: "Photos"));
        }
      },
    );
  }
}




