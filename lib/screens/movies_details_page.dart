import 'package:apple_tv/models/movie.dart';
import 'package:flutter/material.dart';

class MoviesDetailsPage extends StatelessWidget {
  final Movie movie;
  MoviesDetailsPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              'Movies',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
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
            Image.network(
              movie.movieBackdrop,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 60,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      movie.movieName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: Colors.white,
                width: 200,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'PLAY',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: Colors.white,
                width: 200,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  '+ Add to Up Next',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                width: 350,
                child: Text(
                  movie.movieOverview,
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
