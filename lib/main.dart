import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/routes/app_routes.dart';
import 'package:fmp/pages/home_page.dart';

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
            return CupertinoPageRoute(builder: (context) => HomePage());
        }
      },
    );
  }
}




