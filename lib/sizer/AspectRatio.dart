import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AspectRatioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                width: double.infinity,
                height: 100.0,
                child: AspectRatio(
                  aspectRatio: 12 / 20,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
