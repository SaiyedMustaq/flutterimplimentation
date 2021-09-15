import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/pagination/blocStructure/model/BeerModel.dart';

abstract class BeerState {
  const BeerState();
}

class BeerInitialState extends BeerState {
  const BeerInitialState();
}

class BeerLoadingState extends BeerState {
  final String message;

  const BeerLoadingState({
    @required this.message,
  });
}

class BeerSuccessState extends BeerState {
  final List<BeerModel> beers;

  const BeerSuccessState({
    @required this.beers,
  });
}

class BeerErrorState extends BeerState {
  final String error;

  const BeerErrorState({
    @required this.error,
  });
}
