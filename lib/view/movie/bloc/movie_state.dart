part of 'movie_bloc.dart';

@immutable
abstract class MovieState extends Equatable {}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoading extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoadSuccess extends MovieState {
  final List<Movie> movies;
  MovieLoadSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieLoadError extends MovieState {
  final String error;
  MovieLoadError(this.error);

  @override
  List<Object> get props => [error];
}
