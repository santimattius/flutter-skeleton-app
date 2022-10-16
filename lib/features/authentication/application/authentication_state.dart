part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  factory AuthenticationState.initial() {
    return Initial();
  }

  factory AuthenticationState.authenticated() {
    return Authenticated();
  }

  factory AuthenticationState.unauthenticated() {
    return Unauthenticated();
  }
}

class Initial implements AuthenticationState {}

class Authenticated implements AuthenticationState {}

class Unauthenticated implements AuthenticationState {}
