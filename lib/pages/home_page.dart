import 'package:flutter/material.dart';
import '../widgets/film_card.dart';
import '../models/film.dart';


class HomePage extends StatelessWidget {
  final List<Film> films;

  const HomePage({super.key, required this.films});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Izzbox')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemCount: films.length,
          itemBuilder: (context, index) {
            return FilmCard(film: films[index]);
          },
        ),
      ),
    );
  }
}
