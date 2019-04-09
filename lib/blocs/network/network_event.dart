import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:flutter/material.dart';

class NetworkEvent<T> extends BlocEvent {
  NetworkEvent(
      {@required this.url, @required this.event, this.model, this.modelName});

  final NetworkEventType event;
  final T model;
  final String modelName;
  final String url;
}

enum NetworkEventType { requestPost, requestGet, success, failure }
