import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individualhomework/Models/Movie.dart';
import 'package:individualhomework/Screens/Cubit/CatalogCubit.dart';

class MovieScreen extends StatelessWidget {
  final Movie? movie;
  double offset;

  MovieScreen(this.movie, this.offset);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Детали фильма'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            BlocProvider.of<CatalogCubit>(context).showMovies(movie?.categoryName, offset);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            movie?.imageSource ?? '',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
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
                  style: TextStyle(fontSize: 16),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}