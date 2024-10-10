class Movie {
  final String movieName;
  final String movieOverview;
  final String moviePoster;
  final String movieBackdrop;
  final String releaseDate;
  // ignore: prefer_typing_uninitialized_variables
  final id;

  Movie({
    required this.movieName,
    required this.movieOverview,
    required this.moviePoster,
    required this.movieBackdrop,
    required this.releaseDate,
    required this.id,
  });
}
