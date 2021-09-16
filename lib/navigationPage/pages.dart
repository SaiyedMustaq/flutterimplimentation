import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/utils/Constants.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page one'),
      ),
      body: Column(
        children: [
          MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              color: Colors.grey[100],

              // onPressed: () => Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => PageTwo())),
              onPressed: () {
                Navigator.pushNamed(context, '${Constants.routeName.pageTwo}');
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => PageTwo()));
              },
              child: Text('Goto Page 2')),
        ],
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page two'),
      ),
      body: Column(
        children: [
          MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              color: Colors.grey[100],
              onPressed: () {
                // Navigator.pushNamed(
                //     context, '${Constants.routeName.pageThree}');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageThree()));
              },
              child: Text('Goto Page 3')),
        ],
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page three'),
      ),
      body: Column(
        children: [
          MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              color: Colors.grey[100],
              onPressed: () {
                Navigator.pushNamed(context, '${Constants.routeName.pageFour}');
              },
              child: Text('Goto Page 4')),
        ],
      ),
    );
  }
}

class PageFour extends StatelessWidget {
  @override
  final int id;
  PageFour(this.id);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page four'),
      ),
      body: Column(
        children: [
          MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              color: Colors.grey[100],
              onPressed: () {
                //Navigator.pushNamed(context, '${Constants.routeName.pageFive}');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageFive()));
              },
              child: Text('Goto Page 5')),
        ],
      ),
    );
  }
}

class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page five'),
      ),
      body: Column(
        children: [
          MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              color: Colors.grey[100],
              onPressed: () {
                Navigator.popUntil(context,
                    ModalRoute.withName('${Constants.routeName.pageTwo}'));
              },
              child: Text('Goto Page 2')),
        ],
      ),
    );
  }
}
