import 'package:flutter/material.dart';
import 'package:the_movie_db/view/movie/detail/detail_movie_screen.dart';
import 'package:the_movie_db/view/movie/list_movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const ListMovie(),
        '/detail': (context) => const DetailMovieScreen()
      },
    );
  }
}
