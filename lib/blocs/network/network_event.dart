import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:flutter/material.dart';

class NetworkEvent<T> extends BlocEvent {
  NetworkEvent({this.event, this.model});

  final NetworkEventType event;
  final T model;
}

enum NetworkEventType { request, success, failure }
