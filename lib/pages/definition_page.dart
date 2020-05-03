import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DefinitionPage extends StatelessWidget {
  DefinitionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: _buildPage(),
    );
  }

  Widget _buildPage() {
    return SafeArea(
      top: true,
      child: WebView(
        initialUrl: 'https://en.wikipedia.org/wiki/Rainbow',
      ),
    );
  }
}
