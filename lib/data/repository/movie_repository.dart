import 'package:the_movie_db/constant.dart';
import 'package:the_movie_db/data/model/detail_movie.dart';
import 'package:the_movie_db/data/model/movie.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final dio = Dio(
    BaseOptions(baseUrl: Constant.baseUrl, queryParameters: {
      'api_key': 'e40c34a2a097d56ae9509a5ab8c47d44',
      'language': 'en-US',
    }),
  );
  Future<List<Movie>> getMovies(int page) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    if (response.statusCode == 200) {
      final List results = response.data['results'];
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<MovieDetail> getDetailMovie(int id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode == 200) {
      final result = response.data;
      return MovieDetail.fromJson(result);
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
