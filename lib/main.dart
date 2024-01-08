import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_blogapp/blocs/article_bloc/article_bloc.dart';
import 'package:mini_blogapp/blocs/detail_bloc/detail_bloc.dart';
import 'package:mini_blogapp/repositories/article_repository.dart';
import 'package:mini_blogapp/screens/homepage.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ArticleBloc>(
        create: (context) =>
            ArticleBloc(articleRepository: ArticleRepository()),
      ),
      BlocProvider<DetailBloc>(
        create: (context) => DetailBloc(articleRepository: ArticleRepository()),
      )
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ),
  ));
}
