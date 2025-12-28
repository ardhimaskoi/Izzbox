import 'package:flutter/material.dart';
import '../models/film.dart';
import '../widgets/film_card.dart';

class SearchPage extends StatefulWidget {
  final List<Film> films;

  const SearchPage({super.key, required this.films});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredFilms = widget.films
        .where((film) => film.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search film...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() => query = value);
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemCount: filteredFilms.length,
                itemBuilder: (context, index) {
                  return FilmCard(film: filteredFilms[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
