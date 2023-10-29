import 'package:individualhomework/Models/Category.dart';
import 'package:individualhomework/Models/Movie.dart';

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

class MovieState extends CatalogState {
  Movie? movie;
  double offset;

  MovieState(this.movie, this.offset);
}