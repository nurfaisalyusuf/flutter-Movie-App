import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:thmoviedb/model/movie_detail_response.dart';
import 'package:thmoviedb/repositroy/repository.dart';

class MovieDetailBloc {
  final MovieRepositroy _repositroy = MovieRepositroy();
  final BehaviorSubject<MovieDetailResponse> _subject =
      BehaviorSubject<MovieDetailResponse>();

  getMovieDetail(int id) async {
    MovieDetailResponse response = await _repositroy.getMovieDetail(id);
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

  BehaviorSubject<MovieDetailResponse> get subject => _subject;
}

final movieDetailBloc = MovieDetailBloc();
