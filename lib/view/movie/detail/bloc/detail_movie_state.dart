part of 'detail_movie_bloc.dart';

@immutable
abstract class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

class DetailMovieInitial extends DetailMovieState {}

class DetailMovieLoading extends DetailMovieState {}

class DetailMoviewSuccess extends DetailMovieState {
  final MovieDetail movieDetail;
  const DetailMoviewSuccess(this.movieDetail);
}

class DetailMovieError extends DetailMovieState {
  final String error;
  const DetailMovieError(this.error);
}
