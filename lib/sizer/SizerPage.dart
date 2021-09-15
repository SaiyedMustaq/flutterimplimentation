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
        body: SingleChildScrollView(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                width: pageWidth / 20,
                height: pageHeight / 5,
                color: Colors.red,
                child: Center(
                    child: Text(
                  'Height $pageHeight Width $pageWidth\nPage Width /20 Height /5',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ],
          ),
        ));
  }
}

class VerticalColumn extends StatelessWidget {
  const VerticalColumn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: pageHeight / 50),
        Container(
          margin: EdgeInsets.all(5),
          width: pageWidth,
          height: pageHeight / 20,
          color: Colors.red,
          child: Center(
              child: Text(
            'Height $pageHeight Width $pageWidth\nPage height /20 ',
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
            'Height $pageHeight Width $pageWidth\nPage height 15 ',
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
            'Height $pageHeight Width $pageWidth\nPage height 12 ',
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
            'Height $pageHeight Width $pageWidth\nPage height 10 ',
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
            'Height $pageHeight Width $pageWidth\nPage height 8 ',
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
            'Height $pageHeight Width $pageWidth\nPage height 6 ',
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
            'Height $pageHeight Width $pageWidth\nPage height 4 ',
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
            'Height $pageHeight Width $pageWidth\nPage height 2 ',
            style: TextStyle(color: Colors.white),
          )),
        ),
      ],
    );
  }
}
