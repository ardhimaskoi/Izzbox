import 'package:flutter/material.dart';
import '../models/film.dart';
import '../widgets/film_card.dart';

class WatchedPage extends StatelessWidget {
  final List<Film> films;

  const WatchedPage({super.key, required this.films});

  @override
  Widget build(BuildContext context) {
    final watchedFilms = films.where((f) => f.isWatched).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Watched Movies')),
      body: watchedFilms.isEmpty
          ? const Center(
              child: Text(
                'No watched movies yet 🎬',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemCount: watchedFilms.length,
                itemBuilder: (context, index) {
                  return FilmCard(film: watchedFilms[index]);
                },
              ),
            ),
    );
  }
}
