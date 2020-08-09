import 'package:rxdart/subjects.dart';
import 'package:thmoviedb/model/person_response.dart';
import 'package:thmoviedb/repositroy/repository.dart';

class PersonsListBloc {
  final MovieRepositroy _repositroy = MovieRepositroy();
  final BehaviorSubject<PersonResponse> _subject = BehaviorSubject<PersonResponse>();

  getPersons() async {
    PersonResponse response = await _repositroy.getPersons();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PersonResponse> get subject => _subject;
}

final personsBloc = PersonsListBloc();