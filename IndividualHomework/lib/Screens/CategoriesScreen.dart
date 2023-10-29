import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individualhomework/Models/Category.dart';
import 'package:individualhomework/Screens/Cubit/CatalogCubit.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories;

  CategoriesScreen(this.categories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лучшие фильмы. Категории:'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              BlocProvider.of<CatalogCubit>(context).showMovies(category.categoryName, 0);
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.network(
                    category.imageSource ?? '',
                    width: 120,
                    height: 120,
                  ),
                  Text(
                    category.categoryName ?? '',
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