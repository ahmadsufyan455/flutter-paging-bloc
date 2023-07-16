import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/constant.dart';
import 'package:the_movie_db/data/repository/movie_repository.dart';

import 'bloc/detail_movie_bloc.dart';

class DetailMovieScreen extends StatelessWidget {
  const DetailMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as int;

    return BlocProvider(
      create: (context) =>
          DetailMovieBloc(MovieRepository())..add(LoadDetailMovie(id)),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<DetailMovieBloc, DetailMovieState>(
            builder: (context, state) {
              if (state is DetailMoviewSuccess) {
                return Text(state.movieDetail.title!);
              }
              return const Text('Detail Movie');
            },
          ),
        ),
        body: BlocBuilder<DetailMovieBloc, DetailMovieState>(
          builder: (context, state) {
            if (state is DetailMovieLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DetailMoviewSuccess) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(
                      Constant.backdropUrl + state.movieDetail.backdropPath!,
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Release Date: ${state.movieDetail.releaseDate}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),
                              const SizedBox(width: 5),
                              Text(
                                '${state.movieDetail.voteAverage}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Tagline: ${state.movieDetail.tagline}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Genres: ${state.movieDetail.genres!.map((e) => e.name).join(', ')}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Overview:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            state.movieDetail.overview!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is DetailMovieError) {
              return Center(child: Text(state.error));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
