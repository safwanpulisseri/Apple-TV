import 'dart:developer';
import 'package:apple_tv/feature/search/data/service/remote/serivces.dart';
import 'package:flutter/foundation.dart';
import '../../../../home/data/model/movie.dart';

class SearchingData {
  ApiCall apiCall = ApiCall();

  Future<List<Movie>> _search(String value) async {
    final result = await apiCall.search(value);
     if (kDebugMode) {
       print(result);
     }
    if (result.isNotEmpty) {
      List<Movie> movieDetails = result.map((dynamic item) {
        String moviePoster = apiCall.imageLink +
            (item['poster_path'] ?? '/dyA6hSkM0rOIOjIAXHPXTiQ0wxO.jpg');
        String backDrop = apiCall.imageLink +
            (item['backdrop_path'] ?? '/dyA6hSkM0rOIOjIAXHPXTiQ0wxO.jpg');
        return Movie(
          movieName: item['original_title'],
          moviePoster: moviePoster,
          movieBackdrop: backDrop,
          movieOverview: item['overview'],
          releaseDate: item['release_date'],
          id: item['id'],
        );
      }).toList();
      return movieDetails;
    }
    log('somthing went wrong');
    return [];
  }

  Future<List<Movie>> getSearchingMovies(String value) async {
    List<Movie> trendingMovies = await _search(value);
    return trendingMovies;
  }
}
