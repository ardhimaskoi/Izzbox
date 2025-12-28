import 'review.dart';

class Film {
  final String title;
  final String year;
  final double rating;
  final String posterUrl; // 👈 TAMBAH INI
  bool isWatched;
  bool isLiked;
  bool isReviewedByMe;
  final List<Review> reviews;

  Film({
    required this.title,
    required this.year,
    required this.rating,
    required this.posterUrl,
    this.isWatched = false,
    this.isLiked = false,
    this.isReviewedByMe = false,
    List<Review>? reviews,
  }) : reviews = reviews ?? [];
}
