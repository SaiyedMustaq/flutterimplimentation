import 'package:lazy_loading_listview/pagination/futurebuilder/model/MovieListModel.dart';

abstract class MovieRepository {
  Future<MovieListModel> fetchMovies(int pageNumber);
}
