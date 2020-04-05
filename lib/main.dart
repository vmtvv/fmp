import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/app_routes.dart';
import 'package:fmp/details_page.dart';
import 'package:fmp/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => HomePage(title: 'Rainbow Maker'),
        AppRoutes.details: (context) => DetailsPage(title: 'Details')
      },
    );
  }
}




