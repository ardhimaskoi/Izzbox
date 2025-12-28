import 'package:flutter/material.dart';
import '../pages/detail_page.dart';
import '../models/film.dart';

class FilmCard extends StatelessWidget {
  final Film film;

  const FilmCard({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailPage(film: film)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================= POSTER =================
          Expanded(
            child: Stack(
              children: [
                Hero(
                  tag: film.title, // UNIQUE TAG
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      film.posterUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          color: Colors.grey.shade900,
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey.shade900,
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 40,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ================= BADGES =================
                if (film.isWatched)
                  const Positioned(
                    top: 6,
                    right: 6,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                      size: 20,
                    ),
                  ),

                if (film.isLiked)
                  const Positioned(
                    top: 6,
                    left: 6,
                    child: Icon(Icons.favorite, color: Colors.red, size: 20),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          // ================= TITLE =================
          Text(
            film.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),

          const SizedBox(height: 2),

          // ================= RATING =================
          Row(
            children: [
              const Icon(Icons.star, size: 14, color: Colors.amber),
              const SizedBox(width: 4),
              Text(
                film.rating.toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
