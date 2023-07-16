part of 'detail_movie_bloc.dart';

@immutable
abstract class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();

  @override
  List<Object> get props => [];
}

class LoadDetailMovie extends DetailMovieEvent {
  final int id;
  const LoadDetailMovie(this.id);
}
