import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:realworldapp/blocs/validators.dart';
import 'package:realworldapp/bloc_helpers/bloc_provider.dart';

class ArticleFormBloc extends Object with Validators implements BlocBase {
  final _titleController = BehaviorSubject<String>();
  final _descriptionController = BehaviorSubject<String>();
  final _bodyController = BehaviorSubject<String>();

  Stream<String> get title => _titleController.stream.transform(validateTitle);
  Stream<String> get description =>
      _descriptionController.stream.transform(validateDescription);
  Stream<String> get body => _bodyController.stream.transform(validateBody);

  Stream<bool> get submitValid =>
      Observable.combineLatest3(title, description, body, (t, d, b) => true);

  Function(String) get changeTitle => _titleController.sink.add;
  Function(String) get changeDescription => _descriptionController.sink.add;
  Function(String) get changeBody => _bodyController.sink.add;

  dispose() {
    _titleController.close();
    _descriptionController.close();
    _bodyController.close();
  }
}
