
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/model/movie.dart';
import '../../data/service/remote/movie_data.dart';
import '../widget/bottom_widget_home.dart';
import '../widget/dot_indicator_widget.dart';
import '../widget/movie_contents.dart';


class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomePage> {
    int _currentIndex = 0;
  MovieData movieData = MovieData();

  final List<String> imagePath = [
    'assets/main_photo.jpeg',
    'assets/dick_turpin.jpeg',
    'assets/messi_america.jpeg',
    'assets/girls_state.jpeg',
    'assets/slow_horses.jpeg',
    'assets/palm_royale.jpeg',
  ];

  List<Movie> trendingMovies = [];

  @override
  void initState() {
    super.initState();
    _fetchTrendingMovies();
  }

  Future<void> _fetchTrendingMovies() async {
    List<Movie> movies = await movieData.getTrendingMovies();
    setState(() {
      trendingMovies = movies;
    });
  }

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
    icon: const Icon(
      CupertinoIcons.music_note, 
      color: Colors.white,
    ),
  ),
   IconButton(
    onPressed: () {},
    icon: const Icon(
      CupertinoIcons.play_circle, 
      color: Colors.white,
    ),
  ),
  const CircleAvatar(
    radius: 17,
    backgroundColor: Colors.grey,
    child: Text('S', style: TextStyle(color: Colors.white)),
  ),
  const SizedBox(
    width: 20,
  )
]

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: Stack(
                children: [
                 PageView(
  controller: _pageController,
  scrollDirection: Axis.horizontal,
  onPageChanged: (int index) {
    setState(() {
      _currentIndex = index;
    });
    _currentPage.value = index;
  },
  // Show loading or default images until trendingMovies is fetched
  children: trendingMovies.isNotEmpty
      ? trendingMovies.map((movie) {
          return Image.network(
            movie.moviePoster,
            height: 500,
            width: double.infinity,
            fit: BoxFit.cover,
            // Add a placeholder while the image is loading
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    // value: loadingProgress.expectedTotalBytes != null
                    //     ? loadingProgress.cumulativeBytesLoaded /
                    //         loadingProgress.expectedTotalBytes!
                    //     : null,
                  ),
                );
              }
            },
          );
        }).toList()
      : imagePath.map((path) {
          // Default images shown while data is loading
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
                         
                         return DotsIndicator(
          dotsCount: 5,
          position: _currentIndex,
          decorator: DotsDecorator(
            baseColor: Colors.grey,
            activeColor:  Colors.white,
            size: const Size(8.0, 8.0),
            activeSize: const Size(20.0, 8.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            spacing: const EdgeInsets.symmetric(horizontal: 4.0),
          ),);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
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
            const SizedBox(
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
            const SizedBox(
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
            const SizedBox(
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
            const SizedBox(
              height: 40,
            ),
            const BottomWidgetHome()
          ],
        ),
      ),
    );
  }
}
