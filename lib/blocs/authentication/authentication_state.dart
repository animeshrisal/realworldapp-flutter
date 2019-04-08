import 'package:realworldapp/bloc_helpers/bloc_event_state.dart';
import 'package:flutter/material.dart';

class AuthenticationState extends BlocState {
  AuthenticationState(
      {@required this.isAuthenticated,
      this.isAuthenticating: false,
      this.isRegistering: false,
      this.hasFailed: false,
      this.isCheckingLocalStorage: false,
      this.jwt: ''});

  final bool isAuthenticated;
  final bool isAuthenticating;
  final bool isRegistering;
  final bool isCheckingLocalStorage;
  final bool hasFailed;
  final String jwt;

  factory AuthenticationState.notAuthenticated() {
    return AuthenticationState(
      isAuthenticated: false,
    );
  }

  factory AuthenticationState.authenticated(String jwt) {
    return AuthenticationState(
      isAuthenticated: true,
      isCheckingLocalStorage: false,
      jwt: jwt,
    );
  }

  factory AuthenticationState.registering() {
    return AuthenticationState(isAuthenticated: false, isRegistering: true);
  }

  factory AuthenticationState.authenticating() {
    return AuthenticationState(
      isAuthenticated: false,
      isAuthenticating: true,
    );
  }

  factory AuthenticationState.failure() {
    return AuthenticationState(
      isAuthenticated: false,
      hasFailed: true,
    );
  }

  factory AuthenticationState.checkLocalStorage() {
    return AuthenticationState(
        isAuthenticated: false, isCheckingLocalStorage: true);
  }

  factory AuthenticationState.logout() {
    return AuthenticationState(isAuthenticated: false, jwt: '');
  }
}
