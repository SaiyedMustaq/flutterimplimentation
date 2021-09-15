import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_loading_listview/pagination/blocStructure/bloc/BeerBloc.dart';
import 'package:lazy_loading_listview/pagination/blocStructure/bloc/BeerEvent.dart';
import 'package:lazy_loading_listview/pagination/blocStructure/repo/BeerRepository.dart';

import 'PostListBody.dart';

class BeersListPage extends StatelessWidget {
  const BeersListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BeerBloc(
        beerRepository: BeerRepository(),
      )..add(BeerFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bloc Pagination'),
        ),
        body: PostListBody(),
      ),
    );
  }
}

//https://api.punkapi.com/v2/beers?page=1&per_page=10
