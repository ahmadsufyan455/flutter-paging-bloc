class MovieDetail {
  int? id;
  String? title;
  String? backdropPath;
  String? posterPath;
  String? releaseDate;
  dynamic voteAverage;
  String? tagline;
  String? overview;
  List<Genre>? genres;

  MovieDetail({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.tagline,
    required this.overview,
    required this.genres,
  });

  MovieDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    voteAverage = json['vote_average'];
    tagline = json['tagline'];
    overview = json['overview'];
    genres = List<Genre>.from(
      json['genres'].map((genre) => Genre.fromJson(genre)),
    );
  }
}

class Genre {
  int? id;
  String? name;

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
