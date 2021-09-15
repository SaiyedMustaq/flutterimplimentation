import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/main.dart';

class SizerPage extends StatefulWidget {
  @override
  _SizerPageState createState() => _SizerPageState();
}

class _SizerPageState extends State<SizerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Size $pageHeight'),
          Text('Size $pageWidth'),
          Container(
            margin:
                EdgeInsets.only(left: pageWidth / 20, right: pageWidth / 20),
            height: pageHeight / 2,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
