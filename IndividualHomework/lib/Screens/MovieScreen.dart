import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individualhomework/Models/Movie.dart';
import 'package:individualhomework/Models/Note.dart';
import 'package:individualhomework/Screens/Cubit/CatalogCubit.dart';

class MovieScreen extends StatelessWidget {
  List<Note> notes;
  final Movie? movie;
  double offset;
  bool isFavorite;
  bool isEditing = false;
  int currentUpdatedNoteId = -1;
  TextEditingController noteController = TextEditingController();

  MovieScreen(this.notes, this.movie, this.offset, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Детали фильма'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (isFavorite) {
                BlocProvider.of<CatalogCubit>(context).showFavorites(offset);
              } else {
                BlocProvider.of<CatalogCubit>(context).showMovies(movie?.categoryName, offset);
              }
            },
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Информация'),
              Tab(text: 'Заметки'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    movie?.imageSource ?? '',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movie?.name ?? 'Название фильма',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie?.description ?? 'Описание фильма отсутствует',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Категория: ${movie?.categoryName ?? 'Категория не указана'}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Режиссер: ${movie?.director ?? 'Режиссер не указан'}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Год выпуска: ${movie?.year ?? 'Год выпуска не указан'}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: movie != null
                            ? movie!.isFavorite
                            ? ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CatalogCubit>(context)
                                .addOrRemoveFavorite(movie?.id, false, isFavorite, offset);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: const Text('Убрать из избранного'),
                        )
                            : ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CatalogCubit>(context).addOrRemoveFavorite(movie?.id, true, isFavorite, offset);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: const Text('Добавить в избранное'),
                        )
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: noteController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Добавить заметку',
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      String noteText = noteController.text;
                      Note note = Note(filmId: movie?.id ?? 0, text: noteText);

                      if (isEditing)
                        BlocProvider.of<CatalogCubit>(context).editNote(noteText, currentUpdatedNoteId, note, true, isFavorite, offset, movie!.id ?? 0);
                      else
                        BlocProvider.of<CatalogCubit>(context).createNote(note, true, isFavorite, offset, movie!.id ?? 0);

                      isEditing = false;
                      },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('Добавить заметку'),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var index = 0; index < notes.length; index++)
                            ListTile(
                              title: Text('${index + 1}. ${notes[index].text}'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      isEditing = true;
                                      noteController.text = notes[index].text;
                                      currentUpdatedNoteId = notes[index].id!;
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      BlocProvider.of<CatalogCubit>(context).deleteNote(notes[index], true, isFavorite, offset, movie!.id ?? 0);
                                    },
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
