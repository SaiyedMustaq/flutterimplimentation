import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/main.dart';
import 'package:lazy_loading_listview/sizer/AspectRatio.dart';
import 'package:lazy_loading_listview/sizer/MediaQueary.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              minWidth: double.maxFinite,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MediaQueryPage()));
              },
              child: Text('Media Query'),
            ),
            MaterialButton(
              minWidth: double.maxFinite,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AspectRatioPage()));
              },
              child: Text('Aspect Ratio'),
            )
          ],
        ));
  }
}
