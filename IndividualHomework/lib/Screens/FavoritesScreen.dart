import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individualhomework/Models/Movie.dart';
import 'package:individualhomework/Screens/Cubit/CatalogCubit.dart';

class FavoritesScreen extends StatelessWidget {
  List<Movie> movies;
  double offset;
  ScrollController scrollController = ScrollController();

  FavoritesScreen(this.movies, this.offset);

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController(initialScrollOffset: offset);
    return Scaffold(
      appBar: AppBar(
        title: const Flexible(
          child: Text(
            'Избранное',
            overflow: TextOverflow.ellipsis,
          ),
        )
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6, // Adjust the width here
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
              child: DrawerHeader(
                child: Text('Меню:'),
              ),
            ),
            ListTile(
              title: const Text('Категории'),
              tileColor: Colors.white10,
              onTap: () {
                BlocProvider.of<CatalogCubit>(context).showCategories();
              },
            ),
            ListTile(
              title: const Text('Избранное'),
              tileColor: Colors.grey,
              onTap: () {
                BlocProvider.of<CatalogCubit>(context).showFavorites(0);
              },
            ),
            ListTile(
              title: const Text('Мои заметки'),
              tileColor: Colors.white10,
              onTap: () {
                BlocProvider.of<CatalogCubit>(context).showNotes(0);
              },
            ),
          ],
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
              BlocProvider.of<CatalogCubit>(context).showMovie(movie.id, scrollController.offset, true);
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