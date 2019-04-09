import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:flutter/material.dart';

class NetworkState<T> extends BlocState {
  NetworkState(
      {this.isRequesting: false, this.hasRequested: false, this.model});

  final bool isRequesting;
  final bool hasRequested;
  final T model;

  factory NetworkState.initialization() {
    return NetworkState();
  }

  factory NetworkState.requesting() {
    return NetworkState(isRequesting: true);
  }

  factory NetworkState.requestSuccess() {
    return NetworkState(isRequesting: false, hasRequested: true);
  }

  factory NetworkState.requestFailed() {
    return NetworkState(isRequesting: false, hasRequested: false);
  }
}
