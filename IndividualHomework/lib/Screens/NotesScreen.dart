import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individualhomework/Models/Movie.dart';
import 'package:individualhomework/Models/Note.dart';
import 'package:individualhomework/Screens/Cubit/CatalogCubit.dart';

class NotesScreen extends StatelessWidget {
  List<Movie> movies;
  List<Note> notes;
  double offset;
  ScrollController scrollController = ScrollController();

  NotesScreen(this.movies, this.notes, this.offset);

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController(initialScrollOffset: offset);
    return Scaffold(
      appBar: AppBar(
        title: const Flexible(
          child: Text(
            'Заметки',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
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
              tileColor: Colors.white10,
              onTap: () {
                BlocProvider.of<CatalogCubit>(context).showFavorites(0);
              },
            ),
            ListTile(
              title: const Text('Мои заметки'),
              tileColor: Colors.grey,
              onTap: () {
                BlocProvider.of<CatalogCubit>(context).showNotes(0);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          final movieNotes = notes.where((note) => note.filmId == movie.id).toList();

          if (movieNotes.isNotEmpty) {
            return GestureDetector(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movie.name ?? '',
                        style: const TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                      ),
                    ),
                    for (var i = 0; i < movieNotes.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${i + 1}. ${movieNotes[i].text}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
