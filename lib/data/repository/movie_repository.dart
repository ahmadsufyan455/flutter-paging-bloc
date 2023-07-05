import 'package:the_movie_db/constant.dart';
import 'package:the_movie_db/data/model/movie.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final dio = Dio(BaseOptions(baseUrl: Constant.baseUrl));
  Future<List<Movie>> getMovies(int page) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {
        'api_key': 'YOUR API KEY HERE',
        'language': 'en-US',
        'page': page,
      },
    );

    if (response.statusCode == 200) {
      final List results = response.data['results'];
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
