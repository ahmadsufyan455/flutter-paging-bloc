class Movie {
  int? id;
  String? title;
  String? posterPath;
  dynamic voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
  }
}
