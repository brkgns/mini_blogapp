import 'package:mini_blogapp/models/blogs.dart';

abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final Blog blogs;

  DetailLoaded({required this.blogs}); 
}

class DetailError extends DetailState {}