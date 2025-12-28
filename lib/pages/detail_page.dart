import 'package:flutter/material.dart';
import '../models/film.dart';
import '../models/review.dart';

class DetailPage extends StatefulWidget {
  final Film film;

  const DetailPage({super.key, required this.film});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController _reviewController = TextEditingController();
  double _myRating = 4.0;

  @override
  Widget build(BuildContext context) {
    final film = widget.film;

    return Scaffold(
      appBar: AppBar(
        title: Text(film.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= POSTER =================
            AspectRatio(
              aspectRatio: 2 / 3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      film.posterUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          color: Colors.grey.shade900,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey.shade900,
                        child: const Center(
                          child: Icon(Icons.broken_image, size: 60),
                        ),
                      ),
                    ),
                  ),

                  if (film.isLiked)
                    const Positioned(
                      top: 12,
                      left: 12,
                      child: Icon(Icons.favorite, color: Colors.red, size: 28),
                    ),
                  if (film.isWatched)
                    const Positioned(
                      top: 12,
                      right: 12,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.greenAccent,
                        size: 28,
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= TITLE =================
            Text(
              film.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              '${film.year} • ⭐ ${film.rating}',
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // ================= ACTIONS =================
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        film.isWatched = !film.isWatched;
                      });
                    },
                    icon: Icon(film.isWatched ? Icons.check : Icons.visibility),
                    label: Text(film.isWatched ? 'Watched' : 'Mark Watched'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        film.isLiked = !film.isLiked;
                      });
                    },
                    icon: Icon(
                      film.isLiked ? Icons.favorite : Icons.favorite_border,
                    ),
                    label: const Text('Like'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // ================= ADD REVIEW =================
            const Text(
              'Your Review',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Slider(
              value: _myRating,
              min: 1,
              max: 5,
              divisions: 8,
              label: _myRating.toString(),
              onChanged: (value) {
                setState(() {
                  _myRating = value;
                });
              },
            ),

            TextField(
              controller: _reviewController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Write your review...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                if (_reviewController.text.isEmpty) return;

                setState(() {
                  film.reviews.insert(
                    0,
                    Review(
                      username: 'you',
                      rating: _myRating,
                      comment: _reviewController.text,
                    ),
                  );
                  film.isReviewedByMe = true;
                });

                _reviewController.clear();

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Review added')));
              },
              child: const Text('Submit Review'),
            ),

            const SizedBox(height: 32),

            // ================= REVIEWS LIST =================
            const Text(
              'Reviews',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            if (film.reviews.isEmpty)
              const Text('No reviews yet', style: TextStyle(color: Colors.grey))
            else
              Column(
                children: film.reviews.map((review) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 14,
                              child: Icon(Icons.person, size: 16),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              review.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 4),
                            Text(review.rating.toString()),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          review.comment,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
