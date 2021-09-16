import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/main.dart';

class MediaQueryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Query'),
      ),
      body: SingleChildScrollView(child: VerticalColumn()),
    );
  }
}

class VerticalColumn extends StatefulWidget {
  const VerticalColumn({
    Key key,
  }) : super(key: key);

  @override
  _VerticalColumnState createState() => _VerticalColumnState();
}

class _VerticalColumnState extends State<VerticalColumn> {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: [
        SizedBox(height: pageHeight / 50),
        Container(
          margin: EdgeInsets.all(5),
          width: isPortrait ? pageWidth : pageHeight * 2,
          height: isPortrait ? pageHeight / 20 : pageWidth / 20,
          color: Colors.red,
          child: Center(
              child: Text(
            'Page height /20 ',
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          margin: EdgeInsets.all(5),
          width: pageWidth,
          height: pageHeight / 15,
          color: Colors.red,
          child: Center(
              child: Text(
            'Page height /15 ',
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          margin: EdgeInsets.all(5),
          width: pageWidth,
          height: pageHeight / 12,
          color: Colors.red,
          child: Center(
              child: Text(
            'Page height /12 ',
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          margin: EdgeInsets.all(5),
          width: pageWidth,
          height: pageHeight / 10,
          color: Colors.red,
          child: Center(
              child: Text(
            'Page height /10 ',
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          margin: EdgeInsets.all(5),
          width: pageWidth,
          height: pageHeight / 8,
          color: Colors.red,
          child: Center(
              child: Text(
            'Page height /8 ',
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          margin: EdgeInsets.all(5),
          width: pageWidth,
          height: pageHeight / 6,
          color: Colors.red,
          child: Center(
              child: Text(
            'Page height /6 ',
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          margin: EdgeInsets.all(5),
          width: pageWidth,
          height: pageHeight / 4,
          color: Colors.red,
          child: Center(
              child: Text(
            'Page height /4 ',
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          margin: EdgeInsets.all(5),
          width: pageWidth,
          height: pageHeight / 2,
          color: Colors.red,
          child: Center(
              child: Text(
            'Page height /2 ',
            style: TextStyle(color: Colors.white),
          )),
        ),
      ],
    );
  }
}
