import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individualhomework/DbContext/DbProvider.dart';
import 'package:individualhomework/Screens/Cubit/CatalogState.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit() : super(CategoriesState([]));

  void showCategories() async {
    var categories = await DbProvider.db.getAllCategories();
    emit(CategoriesState(categories));
  }

  void showMovies(String? categoryName, double offset) async {
    var movies = await DbProvider.db.getAllMovies();
    var result = movies.where((movie) => movie.categoryName == categoryName).toList();
    emit(MoviesState(result, categoryName, offset));
  }

  void showMovie(int? id, double offset) async {
    var movie = await DbProvider.db.getMovie(id ?? 0);
    emit(MovieState(movie, offset));
  }
}