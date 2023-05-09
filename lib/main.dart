import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example2/src/app.dart';
import 'package:bloc_example2/src/bloc/movie_bloc.dart';
import 'package:bloc_example2/src/cubit/movie_cubit.dart';
import 'package:bloc_example2/src/repository/movie_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => MovieRepository(),
        child: BlocProvider(
          create: (context) => MovieBloc(context.read<MovieRepository>()),
          child: App(),
        ),
      ),
    );
  }
}
