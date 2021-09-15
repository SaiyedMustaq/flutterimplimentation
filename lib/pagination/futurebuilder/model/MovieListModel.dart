import 'package:lazy_loading_listview/pagination/futurebuilder/model/MovieModel.dart';

class MovieListModel {
  MovieListModel({
    this.page,
    this.totalResults,
    this.totalPages,
    this.movies,
  });
  final int page;
  final int totalResults;
  final int totalPages;
  final List<MovieModel> movies;
  MovieListModel.fromMap(Map<String, dynamic> value)
      : page = value['page'],
        totalResults = value['total_results'],
        totalPages = value['total_pages'],
        movies = new List<MovieModel>.from(
            value['results'].map((movie) => MovieModel.fromJson(movie)));
}
