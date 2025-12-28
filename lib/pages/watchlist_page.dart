import 'package:flutter/material.dart';
import '../models/film.dart';
import '../widgets/film_card.dart';

class WatchlistPage extends StatelessWidget {
  final List<Film> films;

  const WatchlistPage({super.key, required this.films});

  @override
  Widget build(BuildContext context) {
    final likedFilms = films.where((f) => f.isLiked).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Watchlist')),
      body: likedFilms.isEmpty
          ? const Center(
              child: Text(
                'No movies in your watchlist yet 🍿',
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
                itemCount: likedFilms.length,
                itemBuilder: (context, index) {
                  return FilmCard(film: likedFilms[index]);
                },
              ),
            ),
    );
  }
}
