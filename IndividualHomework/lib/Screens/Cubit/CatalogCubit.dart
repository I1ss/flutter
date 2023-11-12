import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individualhomework/DbContext/DbProvider.dart';
import 'package:individualhomework/Screens/Cubit/CatalogState.dart';

import '../../Models/Note.dart';

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

  void showMovie(int? id, double offset, bool isFavorite) async {
    var movie = await DbProvider.db.getMovie(id ?? 0);
    var notes = (await DbProvider.db.getAllNotes()).where((note) => note.filmId == id).toList();
    emit(MovieState(movie, notes, offset, isFavorite));
  }

  void showFavorites(double offset) async {
    var movies = await DbProvider.db.getAllMovies();
    var result = movies.where((movie) => movie.isFavorite == true).toList();
    emit(FavoritesState(result, offset));
  }

  void showNotes(double offset) async {
    var notes = await DbProvider.db.getAllNotes();
    var movies = await DbProvider.db.getAllMovies();
    emit(NotesState(movies, notes, offset));
  }

  void addOrRemoveFavorite(int? id, bool isFavoriteMovie, bool isFavorite, double offset) async {
    await DbProvider.db.updateMovieFavoriteStatus(id ?? 0, isFavoriteMovie);
    var movie = await DbProvider.db.getMovie(id ?? 0);
    var notes = (await DbProvider.db.getAllNotes()).where((note) => note.filmId == id).toList();
    emit(MovieState(movie, notes, offset, isFavorite));
  }

  void createNote(Note note, bool isFavoriteMovie, bool isFavorite, double offset, int filmId) async {
    await DbProvider.db.createNote(note);
    var movie = await DbProvider.db.getMovie(note.filmId ?? 0);
    var notes = (await DbProvider.db.getAllNotes()).where((note) => note.filmId == filmId).toList();
    emit(MovieState(movie, notes, offset, isFavorite));
  }

  void deleteNote(Note note, bool isFavoriteMovie, bool isFavorite, double offset, int filmId) async {
    await DbProvider.db.deleteNote(note.id ?? 0);
    var movie = await DbProvider.db.getMovie(note.filmId ?? 0);
    var notes = (await DbProvider.db.getAllNotes()).where((note) => note.filmId == filmId).toList();
    emit(MovieState(movie, notes, offset, isFavorite));
  }

  void editNote(String noteText, int noteId, Note note, bool isFavoriteMovie, bool isFavorite, double offset, int filmId) async {
    await DbProvider.db.updateNoteText(noteId, noteText);
    var movie = await DbProvider.db.getMovie(note.filmId ?? 0);
    var notes = (await DbProvider.db.getAllNotes()).where((note) => note.filmId == filmId).toList();
    emit(MovieState(movie, notes, offset, isFavorite));
  }
}