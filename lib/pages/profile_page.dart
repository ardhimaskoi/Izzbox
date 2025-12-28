import 'package:flutter/material.dart';
import '../models/film.dart';
import 'watched_page.dart';
import 'watchlist_page.dart';
import 'detail_page.dart';

class ProfilePage extends StatelessWidget {
  final List<Film> films;

  const ProfilePage({super.key, required this.films});

  @override
  Widget build(BuildContext context) {
    final watchedFilms = films.where((f) => f.isWatched).toList();
    final likedFilms = films.where((f) => f.isLiked).toList();
    final myReviewedFilms = films.where((f) => f.isReviewedByMe).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= HEADER =================
            Center(
              child: Column(
                children: const [
                  CircleAvatar(radius: 42, child: Icon(Icons.person, size: 42)),
                  SizedBox(height: 12),
                  Text(
                    'Your Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Film Enthusiast 🎬',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ================= STATS =================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatButton(
                  label: 'Watched',
                  value: watchedFilms.length.toString(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WatchedPage(films: films),
                      ),
                    );
                  },
                ),
                _StatButton(
                  label: 'Liked',
                  value: likedFilms.length.toString(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WatchlistPage(films: films),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 36),

            // ================= MY REVIEWS =================
            const Text(
              'My Reviews',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            myReviewedFilms.isEmpty
                ? const Text(
                    'You haven’t reviewed any films yet ✍️',
                    style: TextStyle(color: Colors.grey),
                  )
                : SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: myReviewedFilms.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
itemBuilder: (context, index) {
                        final film = myReviewedFilms[index];
                        return SizedBox(
                          width: 90,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailPage(film: film),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ===== POSTER =====
                                Expanded(
                                  child: Hero(
                                    tag: film.title,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        film.posterUrl,
                                        width: 90,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 6),

                                // ===== TITLE =====
                                Text(
                                  film.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// ================= STAT BUTTON =================
class _StatButton extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const _StatButton({
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
