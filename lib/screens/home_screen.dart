import 'package:apple_tv/controller/movie_data.dart';
import 'package:apple_tv/widgets/lastblackinhome.dart';
import 'package:apple_tv/widgets/movie_contents.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
  });

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  MovieData movieData = MovieData();

  final List<String> imagePath = [
    'assets/WhatsApp Image 2024-03-22 at 17.01.09_cleanup (1).jpeg',
    'assets/WhatsApp Image 2024-03-22 at 17.01.10_cleanup (1).jpeg',
    'assets/WhatsApp Image 2024-03-23 at 09.47.39 (1) (1).jpeg',
    'assets/WhatsApp Image 2024-03-23 at 09.47.40 (1) (1).jpeg',
    'assets/WhatsApp Image 2024-03-23 at 09.47.39 (2).jpeg',
    'assets/WhatsApp Image 2024-03-23 at 09.47.40 (3).jpeg',
  ];

  final _pageController = PageController();

  final _currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 0,
        title: const Row(
          children: [
            Icon(
              Icons.apple,
              size: 50,
              color: Colors.white,
            ),
            Text(
              'tv+',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.music_off,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_circle_outline_sharp,
              color: Colors.white,
            ),
          ),
          CircleAvatar(
            radius: 17,
            child: Text('S', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.grey,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (int index) {
                      _currentPage.value = index;
                    },
                    children: imagePath.map((path) {
                      return Image.asset(
                        path,
                        height: 500,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ValueListenableBuilder<int>(
                        valueListenable: _currentPage,
                        builder: (context, currentPageValue, _) {
                          return PageViewDotIndicator(
                            currentItem: currentPageValue,
                            count: imagePath.length,
                            unselectedColor: Colors.grey,
                            selectedColor: Colors.white,
                            size: const Size(8, 8),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Top Chart: Movies ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            WidgetMovieContents(
              movie: movieData.getTopRatedMovies(),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Newest Releases ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            WidgetMovieContents(movie: movieData.getTrendingMovies()),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'All Kids & Family',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            WidgetMovieContents(movie: movieData.getUpcomingMovies()),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Based on Books',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            WidgetMovieContents(movie: movieData.getTopRatedMovies()),
            SizedBox(
              height: 40,
            ),
            LastBlackinHomeScreen()
          ],
        ),
      ),
    );
  }
}
