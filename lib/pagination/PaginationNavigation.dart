import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/pagination/blocStructure/page/PostsList.dart';
import 'package:lazy_loading_listview/pagination/futurebuilder/page/FutureBuildePaginationPage.dart';
import 'package:lazy_loading_listview/pagination/provider/ProviderPagination.dart';

class PaginationNavigation extends StatelessWidget {
  const PaginationNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MaterialButton(
            child: Text(
              'Goto Bloc Pagination',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            color: Colors.blue,
            onPressed: () {
              gotoPage(context, 0);
            },
          ),
          MaterialButton(
            child: Text(
              'Goto Future Builder Pagination',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            color: Colors.blue,
            onPressed: () {
              gotoPage(context, 1);
            },
          ),
          MaterialButton(
            child: Text(
              'Goto Provider Pagination',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            color: Colors.blue,
            onPressed: () {
              gotoPage(context, 2);
            },
          ),
          MaterialButton(
            onPressed: () {
              gotoPage(context, 3);
            },
          ),
        ],
      ),
    );
  }

  void gotoPage(BuildContext context, int id) {
    switch (id) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BeersListPage()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FutureBuilderPaginationPage()));
        break;
      case 2:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProviderPaginationPage()));
        break;
      case 3:
        break;
      default:
    }
  }
}
