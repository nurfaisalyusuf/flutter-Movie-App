import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:thmoviedb/model/video_response.dart';
import 'package:thmoviedb/repositroy/repository.dart';

class MovieVideosBloc {
  final MovieRepositroy _repositroy = MovieRepositroy();
  final BehaviorSubject<VideoResponse> _subject =
      BehaviorSubject<VideoResponse>();

  getMovieVideos(int id) async {
    VideoResponse response = await _repositroy.getMoviesVideo(id);
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

  BehaviorSubject<VideoResponse> get subject => _subject;
}

final movieVideosBloc = MovieVideosBloc();
