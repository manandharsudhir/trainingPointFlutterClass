class ApiConstants {
  static const String baseurl = 'https://api.themoviedb.org/3/';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String nowPlaying = "movie/now_playing";
  static const String popular = "movie/popular";
  static const String trendingPerDay = "trending/movie/day";
  static const String upcoming = "movie/upcoming";
  static const String search = "search/movie";
  static String movie(int id) => "movie/$id";
  static String similarMovies(int id) => "movie/$id/similar";
}
