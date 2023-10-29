import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individualhomework/Models/Movie.dart';
import 'package:individualhomework/Screens/Cubit/CatalogCubit.dart';

class MoviesScreen extends StatelessWidget {
  String? category;
  List<Movie> movies;
  double offset;
  ScrollController scrollController = ScrollController();

  MoviesScreen(this.category, this.movies, this.offset);

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController(initialScrollOffset: offset);
    return Scaffold(
      appBar: AppBar(
        title: Flexible(
          child: Text(
            'Категория: ${category ?? "Неизвестна"}',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            BlocProvider.of<CatalogCubit>(context).showCategories();
          },
        ),
      ),
      body: GridView.builder(
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              BlocProvider.of<CatalogCubit>(context).showMovie(movie.id, scrollController.offset);
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.network(
                    movie.imageSource ?? '',
                    width: 120,
                    height: 120,
                  ),
                  Text(
                    movie.name ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}