import 'dart:developer';
import 'package:apple_tv/models/movie.dart';
import 'package:apple_tv/serivces.dart';

class SearchingData {
  ApiCall apiCall = ApiCall();

  Future<List<Movie>> _search(String value) async {
    final result = await apiCall.search(value);
    print(result);
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
