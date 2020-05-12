import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakerPage extends StatefulWidget {
  MakerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MakerPageState createState() => _MakerPageState();
}

class _MakerPageState extends State<MakerPage> {
  final List<String> colorNames = <String>[
    'Grapefruit',
    'Bittersweet',
    'Sunflower',
    'Grass',
    'Mint',
    'Aqua',
    'Blue Jeans',
    'Lavander',
    'Pink Rose'
  ];
  final List<int> colorCodes = <int>[
    0xFFED5565,
    0xFFFC6E51,
    0xFFFFCE54,
    0xFFADD468,
    0xFF48CFAD,
    0xFF4FC1E9,
    0xFF5D9CEC,
    0xFFAC92EC,
    0xFFEC87C0
  ];

  final Set<int> _selectedColors = Set<int>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.title),
        ),
        child: _buildRainbow());
  }

  Widget _buildRainbow() {
    return SafeArea(
      top: true,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: colorNames.length,
              itemBuilder: _buildRow,
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              child: CupertinoButton.filled(
                child: Text('Make'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    final int colorCode = colorCodes[index];
    final bool alreadySelected = _selectedColors.contains(colorCode);

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Color(colorCode),
          boxShadow: [
            BoxShadow(
                color: Color(0x4D000000),
                blurRadius: 3.0,
                offset: Offset(2.0, 2.0)),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              alreadySelected ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.white,
            ),
            Text(
              colorNames[index],
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text('#' + colorCode.toRadixString(16).toUpperCase(),
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          if (alreadySelected) {
            _selectedColors.remove(colorCode);
          } else {
            _selectedColors.add(colorCode);
          }
        });
      },
    );
  }

  _navigateAndDisplayResult(BuildContext context, String routeName) async {
    final result = await Navigator.of(context).pushNamed(routeName);

    if (result != null) {
      await _showAlertDialog(result);
    }
  }

  Future<void> _showAlertDialog(String message) async {
    return showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Fetched result'),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
