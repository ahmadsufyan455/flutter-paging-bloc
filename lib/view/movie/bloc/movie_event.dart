part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent extends Equatable {}

class LoadMovieList extends MovieEvent {
  @override
  List<Object> get props => [];
}

class LoadMoreMovies extends MovieEvent {
  @override
  List<Object> get props => [];
}
