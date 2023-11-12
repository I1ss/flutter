import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individualhomework/Screens/CategoriesScreen.dart';
import 'package:individualhomework/Screens/Cubit/CatalogCubit.dart';
import 'package:individualhomework/Screens/FavoritesScreen.dart';
import 'package:individualhomework/Screens/MoviesScreen.dart';
import 'package:individualhomework/Screens/NotesScreen.dart';

import 'Screens/Cubit/CatalogState.dart';
import 'Screens/MovieScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => CatalogCubit(),
        child: BlocBuilder<CatalogCubit, CatalogState>(
          builder: (context, state) {
            if (state is CategoriesState) {
              BlocProvider.of<CatalogCubit>(context).showCategories();
              return CategoriesScreen(state.categories);
            }
            if (state is MoviesState) {
              return MoviesScreen(state.categoryName, state.movies, state.offset);
            }
            if (state is MovieState) {
              return MovieScreen(state.notes, state.movie, state.offset, state.isFavorite);
            }
            if (state is FavoritesState) {
              return FavoritesScreen(state.movies, state.offset);
            }
            if (state is NotesState) {
              return NotesScreen(state.movies, state.notes, state.offset);
            }
            return const Center(child: Text('Не подгрузилось...'));
          },
        ),
      ),
    );
  }
}