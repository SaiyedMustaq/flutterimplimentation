import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_loading_listview/pagination/futurebuilder/model/MovieListModel.dart';

import 'MovieRepository.dart';

const MOVIE_API_KEY =
    "d2d6b80f09b12b49732cf20e7647ae1f"; // Replace with your own API key
const BASE_URL = "https://api.themoviedb.org/3/movie/";
enum MovieLoadMoreStatus { LOADING, STABLE }

class MovieProdRepository implements MovieRepository {
  @override
  Future<MovieListModel> fetchMovies(int pageNumber) async {
    http.Response response = await http.get(BASE_URL +
        "popular?api_key=" +
        MOVIE_API_KEY +
        "&page=" +
        pageNumber.toString());
    return compute(parseMovies, response.body);
  }
}

MovieListModel parseMovies(String responseBody) {
  final Map moviesMap = JsonCodec().decode(responseBody);
  print(moviesMap);
  MovieListModel movies = MovieListModel.fromMap(moviesMap);
  if (movies == null) {
    throw new Exception("An error occurred : [ Status Code = ]");
  }
  return movies;
}
