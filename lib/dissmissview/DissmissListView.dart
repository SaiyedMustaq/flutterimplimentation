import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DissmissViewPage extends StatefulWidget {
  const DissmissViewPage({Key key}) : super(key: key);

  @override
  _DissmissViewPageState createState() => _DissmissViewPageState();
}

class _DissmissViewPageState extends State<DissmissViewPage> {
  final itemsList = List<String>.generate(10, (n) => "List item ${n}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: generateItemsList(),
    );
  }

  ListView generateItemsList() {
    return ListView.builder(
      itemCount: itemsList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: slideRightBackground(),
          secondaryBackground: slideLeftBackground(),
          key: Key(itemsList[index]),
          child: InkWell(
              onTap: () {
                print("${itemsList[index]} clicked");
              },
              child: ListTile(title: Text('${itemsList[index]}'))),
        );
      },
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
