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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image(image: NetworkImage(photo.url)),
          Text(photo.title),
        ],
      ),
    );
  }
}
