import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_loading_listview/pagination/blocStructure/bloc/beerBlock.dart';
import 'package:lazy_loading_listview/pagination/blocStructure/model/BeerModel.dart';
import 'package:lazy_loading_listview/pagination/blocStructure/widget/BeerListItem.dart';

class PostListBody extends StatelessWidget {
  final List<BeerModel> _beers = [];
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<BeerBloc, BeerState>(
        listener: (context, beerState) {
          if (beerState is BeerLoadingState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(beerState.message)));
          } else if (beerState is BeerSuccessState && beerState.beers.isEmpty) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('No more beers')));
          } else if (beerState is BeerErrorState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(beerState.error)));
            context.bloc<BeerBloc>().isFetching = false;
          }
          return;
        },
        builder: (context, beerState) {
          if (beerState is BeerInitialState ||
              beerState is BeerLoadingState && _beers.isEmpty) {
            return CircularProgressIndicator();
          } else if (beerState is BeerSuccessState) {
            _beers.addAll(beerState.beers);
            context.bloc<BeerBloc>().isFetching = false;
            Scaffold.of(context).hideCurrentSnackBar();
          } else if (beerState is BeerErrorState && _beers.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.bloc<BeerBloc>()
                      ..isFetching = true
                      ..add(BeerFetchEvent());
                  },
                  icon: Icon(Icons.refresh),
                ),
                const SizedBox(height: 15),
                Text(beerState.error, textAlign: TextAlign.center),
              ],
            );
          }
          return ListView.separated(
            controller: _scrollController
              ..addListener(() {
                if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent &&
                    !context.bloc<BeerBloc>().isFetching) {
                  context.bloc<BeerBloc>()
                    ..isFetching = true
                    ..add(BeerFetchEvent());
                }
              }),
            itemBuilder: (context, index) => BeerListItem(_beers[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: _beers.length,
          );
        },
      ),
    );
  }
}
