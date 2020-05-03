import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/models/photo.dart';

class PhotoDetailsPage extends StatelessWidget {
  PhotoDetailsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final Photo photo = ModalRoute.of(context).settings.arguments;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: _buildPage(photo),
    );
  }

  Widget _buildPage(Photo photo) {
    return SafeArea(
      top: true,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(
              image: NetworkImage(photo.url),
              width: 300,
              height: 300,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                photo.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
