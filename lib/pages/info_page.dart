import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/models/photo.dart';
import 'package:fmp/routes/app_routes.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final Photo photo = ModalRoute.of(context).settings.arguments;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: _buildPage(context, photo),
    );
  }

  Widget _buildPage(BuildContext context, Photo photo) {
    return SafeArea(
      top: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildNavigationButton(context, "Show definition",
              "Open web page with rainbow description", AppRoutes.definition),
          _buildNavigationButton(context, "Open map",
              "Show rainbow city location on the map", AppRoutes.map),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(
      BuildContext context, String title, String subtitle, String routeName) {
    return GestureDetector(
      child: Container(
          height: 100,
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          subtitle,
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              Divider(),
            ],
          )),
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
    );
  }
}
