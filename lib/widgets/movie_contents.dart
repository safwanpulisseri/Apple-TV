import 'package:apple_tv/controller/movie_data.dart';
import 'package:apple_tv/models/movie.dart';
import 'package:apple_tv/screens/movies_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetMovieContents extends StatefulWidget {
  @override
  State<WidgetMovieContents> createState() => _WidgetMovieContentsState();
}

class _WidgetMovieContentsState extends State<WidgetMovieContents> {
  // final List<String> imagePath = [
  final MovieData _movieData = MovieData();

  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    List<Movie> movies = await _movieData.getTrendingMovies();
    setState(() {
      _movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        padEnds: false,
        itemCount: _movies.length,
        controller: PageController(
          viewportFraction: 0.65,
        ),
        itemBuilder: (context, index) {
          Movie movie = _movies[index];
          return Column(
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoviesDetailsPage(movie: movie),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        width: 260,
                        height: MediaQuery.of(context).size.height,
                        movie.moviePoster,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.movieName,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Text(movie.releaseDate),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
