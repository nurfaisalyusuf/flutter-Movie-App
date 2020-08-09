import 'package:rxdart/subjects.dart';
import 'package:thmoviedb/model/genre_response.dart';
import 'package:thmoviedb/repositroy/repository.dart';

class GenresListBloc {
  final MovieRepositroy _repositroy = MovieRepositroy();
  final BehaviorSubject<GenreResponse> _subject =
      BehaviorSubject<GenreResponse>();

  getGenres() async {
    GenreResponse response = await _repositroy.getGenres();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<GenreResponse> get subject => _subject;
}

final genresBloc = GenresListBloc();
