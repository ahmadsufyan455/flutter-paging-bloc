import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:the_movie_db/data/model/detail_movie.dart';
import 'package:the_movie_db/data/repository/movie_repository.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final MovieRepository _movieRepository;
  DetailMovieBloc(this._movieRepository) : super(DetailMovieInitial()) {
    on<LoadDetailMovie>((event, emit) async {
      emit(DetailMovieLoading());
      try {
        final result = await _movieRepository.getDetailMovie(event.id);
        emit(DetailMoviewSuccess(result));
      } catch (e) {
        emit(DetailMovieError(e.toString()));
      }
    });
  }
}
