import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.title),
        ),
        child: _buildPage());
  }

  Widget _buildPage() {
    return WillPopScope(
      onWillPop: () => _showConfirmationDialog('You will be navigatated to the previous page.'),
      child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildNavigationButton('42'),
              _buildNavigationButton('AbErVaLlG'),
            ],
          )
      ),
    );
  }

  Widget _buildNavigationButton(String result) {
    return Container(
      padding: EdgeInsets.all(8),
      child: CupertinoButton.filled(
        child: Text('Return $result'),
        onPressed: () {
          Navigator.of(context).pop(result);
        },
      ),
    );
  }

  Future<bool> _showConfirmationDialog(String message) async {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Are you sure?'),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            CupertinoDialogAction(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}