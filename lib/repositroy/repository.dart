import 'package:dio/dio.dart';
import 'package:thmoviedb/model/cast_response.dart';
import 'package:thmoviedb/model/genre_response.dart';
import 'package:thmoviedb/model/movie_detail_response.dart';
import 'package:thmoviedb/model/movie_response.dart';
import 'package:thmoviedb/model/person_response.dart';
import 'package:thmoviedb/model/video_response.dart';

class MovieRepositroy {
  final String apiKey = "6ede9fd962b202f0b81f518499e40760";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = '$mainUrl/genre/movie/list';
  var getPersonUrl = '$mainUrl/trending/person/week';
  var movieUrl = '$mainUrl/movie';

  Future<MovieResponse> getMovies() async {
    var params = {"api_key": apiKey, "langauge": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "langauge": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apiKey, "langauge": "en-US", "page": 1};
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace: $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {"api_key": apiKey};
    try {
      Response response = await _dio.get(getPersonUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace: $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "langauge": "en-US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {"api_key": apiKey, "langauge": "en-US"};
    try {
      Response response =
          await _dio.get(movieUrl + "/$id", queryParameters: params);
      print(movieUrl + "/$id");
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {"api_key": apiKey, "langauge": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {"api_key": apiKey, "langauge": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/similar",
          queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<VideoResponse> getMoviesVideo(int id) async {
    var params = {"api_key": apiKey, "langauge": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace: $stacktrace");
      return VideoResponse.withError("$error");
    }
  }
}