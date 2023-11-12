import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:individualhomework/Models/Category.dart';
import 'package:individualhomework/Screens/Cubit/CatalogCubit.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Category> categories;

  CategoriesScreen(this.categories);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Category> filteredCategories = widget.categories.where((category) {
      return searchQuery.isEmpty ||
          category.categoryName!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    filteredCategories.sort((a, b) {
      bool aContainsQuery = a.categoryName!.toLowerCase().contains(searchQuery.toLowerCase());
      bool bContainsQuery = b.categoryName!.toLowerCase().contains(searchQuery.toLowerCase());
      return aContainsQuery == bContainsQuery ? 0 : (aContainsQuery ? -1 : 1);
    });

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: const Center(
                child: Text(
                  'Категории:',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: searchController,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (query) {
                    setState(() {
                      searchQuery = query;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Поиск по категориям',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
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
              tileColor: Colors.grey,
              onTap: () {},
            ),
            ListTile(
              title: const Text('Избранное'),
              tileColor: Colors.white10,
              onTap: () {
                BlocProvider.of<CatalogCubit>(context).showFavorites(0);
              },
            ),
            ListTile(
              title: const Text('Заметки'),
              tileColor: Colors.white10,
              onTap: () {
                BlocProvider.of<CatalogCubit>(context).showNotes(0);
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: filteredCategories.length,
        itemBuilder: (context, index) {
          final category = filteredCategories[index];

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
