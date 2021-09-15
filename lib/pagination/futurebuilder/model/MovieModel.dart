class MovieModel {
  MovieModel(
      {this.title,
      this.posterPath,
      this.id,
      this.overview,
      this.voteAverage,
      this.favored});

  final String title, posterPath, id, overview;
  final String voteAverage;
  bool favored;

  factory MovieModel.fromJson(Map value) {
    return MovieModel(
        title: value['title'],
        posterPath: value['poster_path'],
        id: value['id'].toString(),
        overview: value['overview'],
        voteAverage: value['vote_average'].toString(),
        favored: false);
  }
}
