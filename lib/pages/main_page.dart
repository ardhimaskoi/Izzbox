import 'package:flutter/material.dart';

import '../models/film.dart';
import '../models/review.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  // SOURCE OF TRUTH + REVIEW
final List<Film> films = [
    Film(
      title: 'Interstellar',
      year: '2014',
      rating: 4.5,
      posterUrl:
          'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
      isReviewedByMe: true,
      reviews: [
        Review(
          username: 'you',
          rating: 5.0,
          comment: 'A visually stunning masterpiece.',
        ),
      ],
    ),
    Film(
      title: 'Inception',
      year: '2010',
      rating: 4.6,
      posterUrl:
          'https://image.tmdb.org/t/p/w500/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg',
      reviews: [
        Review(
          username: 'dreamer',
          rating: 4.5,
          comment: 'Mind-bending and stylish.',
        ),
      ],
    ),
    Film(
      title: 'Parasite',
      year: '2019',
      rating: 4.4,
      posterUrl:
          'https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg',
      isReviewedByMe: true,
      reviews: [
        Review(
          username: 'you',
          rating: 5.0,
          comment: 'Sharp social commentary with perfect execution.',
        ),
      ],
    ),
    Film(
      title: 'Dune',
      year: '2021',
      rating: 4.2,
      posterUrl:
          'https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
      reviews: [
        Review(
          username: 'scififan',
          rating: 4.0,
          comment: 'Epic scale, slow but immersive.',
        ),
      ],
    ),
    Film(
      title: 'The Dark Knight',
      year: '2008',
      rating: 4.7,
      posterUrl:
          'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
      reviews: [
        Review(
          username: 'batfan',
          rating: 5.0,
          comment: 'The greatest superhero film ever made.',
        ),
      ],
    ),
    Film(
      title: 'Fight Club',
      year: '1999',
      rating: 4.4,
      posterUrl:
          'https://image.tmdb.org/t/p/w500/bptfVGEQuv6vDTIMVCHjJ9Dz8PX.jpg',
      reviews: [
        Review(
          username: 'critic',
          rating: 4.5,
          comment: 'Dark, provocative, and iconic.',
        ),
      ],
    ),
    Film(
      title: 'The Matrix',
      year: '1999',
      rating: 4.6,
      posterUrl:
          'https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg',
      reviews: [
        Review(
          username: 'neo',
          rating: 5.0,
          comment: 'A genre-defining sci-fi classic.',
        ),
      ],
    ),
    Film(
      title: 'Everything Everywhere All at Once',
      year: '2022',
      rating: 4.3,
      posterUrl:
          'https://image.tmdb.org/t/p/w500/w3LxiVYdWWRvEVdn5RYq6jIqkb1.jpg',
      reviews: [
        Review(
          username: 'multiverse',
          rating: 4.5,
          comment: 'Chaotic, emotional, and creative.',
        ),
      ],
    ),
    Film(
      title: 'Oppenheimer',
      year: '2023',
      rating: 4.6,
      posterUrl:
          'https://image.tmdb.org/t/p/w500/ptpr0kGAckfQkJeJIt8st5dglvd.jpg',
      isReviewedByMe: true,
      reviews: [
        Review(
          username: 'you',
          rating: 4.5,
          comment: 'Intense dialogue-driven masterpiece.',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(films: films),
      SearchPage(films: films),
      ProfilePage(films: films),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
