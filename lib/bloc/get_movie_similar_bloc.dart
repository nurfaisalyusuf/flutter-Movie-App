import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:thmoviedb/model/movie_response.dart';
import 'package:thmoviedb/repositroy/repository.dart';

class SimilarMoviesBloc {
  final MovieRepositroy _repositroy = MovieRepositroy();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getSimilarMovies(int id) async {
    MovieResponse response = await _repositroy.getSimilarMovies(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final similarMoviesBloc = SimilarMoviesBloc();
