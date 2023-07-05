import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:the_movie_db/data/repository/movie_repository.dart';

import '../../../data/model/movie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository _movieRepository;
  int page = 1;

  MovieBloc(this._movieRepository) : super(MovieInitial()) {
    on<LoadMovieList>((event, emit) async {
      page = 1;
      emit(MovieLoading());
      try {
        final results = await _movieRepository.getMovies(page);
        emit(MovieLoadSuccess(results));
      } catch (e) {
        emit(MovieLoadError(e.toString()));
      }
    });

    on<LoadMoreMovies>((event, emit) async {
      page++;

      try {
        final results = await _movieRepository.getMovies(page);
        final currentState = state as MovieLoadSuccess;
        final updatedMovies = currentState.movies + results;
        emit(MovieLoadSuccess(updatedMovies));
      } catch (e) {
        emit(MovieLoadError(e.toString()));
      }
    });
  }
}
