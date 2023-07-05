class Movie {
  String? title;
  String? posterPath;
  dynamic voteAverage;

  Movie({
    required this.title,
    required this.posterPath,
    required this.voteAverage,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
  }
}
