import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Rainbow Maker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  /*final colorsMap = const {
    'Grapefruit': 0xED5565,
    'Bittersweet ': 0xFC6E51,
    'Sunflower': 0xFFCE54,
    'Grass': 0xADD468,
    'Mint': 0x48CFAD,
    'Aqua': 0x4FC1E9,
    'Blue Jeans': 0x5D9CEC,
    'Lavander': 0xAC92EC,
    'Pink Rose': 0xEC87C0,
  };*/

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
                child:
                Container(
                  padding: EdgeInsets.all(8),
                  child: CupertinoButton.filled(
                    child: Text('Make'),
                    onPressed: () => { },
                  ),
                )
            )
          ],
        )
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
                offset: Offset(2.0, 2.0)
            ),
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
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
                '#' + colorCode.toRadixString(16).toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      onTap:  () {
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
}
