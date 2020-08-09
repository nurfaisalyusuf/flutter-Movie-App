import 'package:rxdart/subjects.dart';
import 'package:thmoviedb/model/movie_response.dart';
import 'package:thmoviedb/repositroy/repository.dart';

class MoviesListBloc {
  final MovieRepositroy _repositroy = MovieRepositroy();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repositroy.getMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final moviesBloc = MoviesListBloc();