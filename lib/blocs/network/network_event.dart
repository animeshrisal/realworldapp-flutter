import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:flutter/material.dart';

class NetworkEvent<T> extends BlocEvent {
  NetworkEvent({this.event, @required this.model, @required this.modelName});

  final NetworkEventType event;
  final T model;
  final String modelName;
}

enum NetworkEventType { request, success, failure }
