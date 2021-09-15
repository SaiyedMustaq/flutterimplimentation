import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/pagination/futurebuilder/page/ModelMovieTile.dart';

class MoviesPageDetails extends StatefulWidget {
  Results movieModel;
  MoviesPageDetails({Key key, this.movieModel}) : super(key: key);

  @override
  _MoviesPageDetailsState createState() => _MoviesPageDetailsState();
}

class _MoviesPageDetailsState extends State<MoviesPageDetails> {
  static const String IMAGE_BASE_URL = "http://image.tmdb.org/t/p/w185";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'image',
            child: Image.network(
              IMAGE_BASE_URL + widget.movieModel.posterPath,
            ),
          ),
        ),
      ),
    );
  }
}
