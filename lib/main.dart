import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/app_routes.dart';
import 'package:fmp/details_page.dart';
import 'package:fmp/home_page.dart';
import 'package:fmp/rotation_route.dart';

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
            break;
          case AppRoutes.details:
            return RotationRoute(page: DetailsPage(title: "Details"));
            break;
        }
      },
    );
  }
}




