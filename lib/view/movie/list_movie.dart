import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/data/repository/movie_repository.dart';
import 'package:the_movie_db/view/movie/bloc/movie_bloc.dart';
import 'package:the_movie_db/widget/item_movie.dart';

class ListMovie extends StatelessWidget {
  const ListMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Movie - Now Playing'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => MovieBloc(
          MovieRepository(),
        )..add(LoadMovieList()),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieLoadSuccess) {
              return NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollEndNotification &&
                      scrollNotification.metrics.pixels >=
                          scrollNotification.metrics.maxScrollExtent) {
                    // call load more event
                    context.read<MovieBloc>().add(LoadMoreMovies());
                  }
                  return false;
                },
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (index < state.movies.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: state.movies[index].id,
                          ),
                          child: ItemMovie(movie: state.movies[index]),
                        ),
                      );
                    } else {
                      // Show a loading indicator at the end of the list while loading more movies
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                  itemCount: state.movies.length +
                      1, // Add 1 for the loading indicator
                ),
              );
            } else if (state is MovieLoadError) {
              return Center(
                child: Text(state.error),
              );
            }
            return const Center(
              child: Text('Can\'t load data'),
            );
          },
        ),
      ),
    );
  }
}
