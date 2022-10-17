part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  factory AuthenticationEvent.authCheckRequested() {
    return AuthCheckRequested();
  }

  factory AuthenticationEvent.signedOut() {
    return SignedOut();
  }
}

class AuthCheckRequested implements AuthenticationEvent {}

class SignedOut implements AuthenticationEvent {}
