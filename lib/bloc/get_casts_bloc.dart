import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:thmoviedb/model/cast_response.dart';
import 'package:thmoviedb/repositroy/repository.dart';

class CastsBloc {
  final MovieRepositroy _repositroy = MovieRepositroy();
  final BehaviorSubject<CastResponse> _subject =
      BehaviorSubject<CastResponse>();

  getCasts(int id) async {
    CastResponse response = await _repositroy.getCasts(id);
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

  BehaviorSubject<CastResponse> get subject => _subject;
}

final castsBloc = CastsBloc();
