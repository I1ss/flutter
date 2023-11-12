import 'package:individualhomework/Models/Category.dart';
import 'package:individualhomework/Models/Movie.dart';

import '../../Models/Note.dart';

abstract class CatalogState {}

class CategoriesState extends CatalogState {
  List<Category> categories = [];

  CategoriesState(this.categories);
}

class MoviesState extends CatalogState {
  String? categoryName;
  List<Movie> movies = [];
  double offset;

  MoviesState(this.movies, this.categoryName, this.offset);
}

class FavoritesState extends CatalogState {
  List<Movie> movies = [];
  double offset;

  FavoritesState(this.movies, this.offset);
}

class MovieState extends CatalogState {
  List<Note> notes = [];
  Movie? movie;
  double offset;
  bool isFavorite;

  MovieState(this.movie, this.notes, this.offset, this.isFavorite);
}

class NotesState extends CatalogState {
  List<Movie> movies = [];
  List<Note> notes = [];
  double offset;

  NotesState(this.movies, this.notes, this.offset);
}