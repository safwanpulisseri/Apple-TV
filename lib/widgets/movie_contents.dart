import 'package:flutter/material.dart';
import 'package:apple_tv/models/movie.dart';
import 'package:apple_tv/screens/movies_details_page.dart';

class WidgetMovieContents extends StatefulWidget {
  final Future<List<Movie>> movie;
  const WidgetMovieContents({required this.movie, super.key});

  @override
  State<WidgetMovieContents> createState() => _WidgetMovieContentsState();
}

class _WidgetMovieContentsState extends State<WidgetMovieContents> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: widget.movie,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          List<Movie> movies = snapshot.data!;
          return SizedBox(
            height: 225,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              padEnds: false,
              itemCount: movies.length,
              controller: PageController(viewportFraction: 0.65),
              itemBuilder: (context, index) {
                Movie movie = movies[index];
                return SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MoviesDetailsPage(movie: movie),
                            ),
                          );
                        },
                        child: Container(
                          width: 300,
                          height: 150,
                          margin: const EdgeInsets.only(left: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              movie.movieBackdrop,
                              width: 260,
                              height: MediaQuery.of(context).size.height,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.movieName,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.fade,
                                  ),
                                  Text(movie.releaseDate),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
