import 'dart:async';

class Validators {
  final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.length > 3) {
      sink.add(username);
    } else {
      sink.addError('Please enter a username that has more than 3 characters');
    }
  });

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError('Invalid password, please enter more than 4 characters');
    }
  });

  final validateTitle =
      StreamTransformer<String, String>.fromHandlers(handleData: (title, sink) {
    if (title.length > 0) {
      sink.add(title);
    } else {
      sink.addError("Title can't be empty");
    }
  });

  final validateBody =
      StreamTransformer<String, String>.fromHandlers(handleData: (body, sink) {
    if (body.length > 0) {
      sink.add(body);
    } else {
      sink.addError("Body can't be empty");
    }
  });

  final validateDescription = StreamTransformer<String, String>.fromHandlers(
      handleData: (description, sink) {
    if (description.length > 0) {
      sink.add(description);
    } else {
      sink.addError("Description can't be empty");
    }
  });
}
