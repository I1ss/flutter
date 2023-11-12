import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individualhomework/Models/Movie.dart';
import 'package:individualhomework/Screens/Cubit/CatalogCubit.dart';

class MoviesScreen extends StatefulWidget {
  String? category;
  List<Movie> movies;
  double offset;
  ScrollController scrollController = ScrollController();

  MoviesScreen(this.category, this.movies, this.offset);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late TextEditingController searchController;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    List<Movie> filteredMovies = widget.movies.where((movie) {
      return searchQuery.isEmpty ||
          movie.name!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    filteredMovies.sort((a, b) {
      bool aContainsQuery = a.name!.toLowerCase().contains(searchQuery.toLowerCase());
      bool bContainsQuery = b.name!.toLowerCase().contains(searchQuery.toLowerCase());
      return aContainsQuery == bContainsQuery ? 0 : (aContainsQuery ? -1 : 1);
    });

    widget.scrollController = ScrollController(initialScrollOffset: widget.offset);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Center(
                child: Text(
                  widget.category ?? "Неизвестна",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Поиск по фильмам',
                  ),
                  onChanged: (query) {
                    setState(() {
                      searchQuery = query;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            BlocProvider.of<CatalogCubit>(context).showCategories();
          },
        ),
      ),
      body: GridView.builder(
        controller: widget.scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: filteredMovies.length,
        itemBuilder: (context, index) {
          final movie = filteredMovies[index];
          return GestureDetector(
            onTap: () {
              BlocProvider.of<CatalogCubit>(context).showMovie(movie.id, widget.scrollController.offset, false);
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
