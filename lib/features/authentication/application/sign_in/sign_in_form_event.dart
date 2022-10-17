part of 'sign_in_form_bloc.dart';

abstract class SignInFormEvent extends Equatable {
  const SignInFormEvent();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;

  factory SignInFormEvent.emailChanged(String emailStr) {
    return EmailChanged(emailStr);
  }

  factory SignInFormEvent.passwordChanged(String passwordStr) {
    return PasswordChanged(passwordStr);
  }

  factory SignInFormEvent.registerWithEmailAndPasswordPressed() {
    return RegisterWithEmailAndPasswordPressed();
  }

  factory SignInFormEvent.signInWithEmailAndPasswordPressed() {
    return SignInWithEmailAndPasswordPressed();
  }

  factory SignInFormEvent.signInWithGooglePressed() {
    return SignInWithGooglePressed();
  }
}

class EmailChanged extends SignInFormEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends SignInFormEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class RegisterWithEmailAndPasswordPressed extends SignInFormEvent {}

class SignInWithGooglePressed extends SignInFormEvent {}

class SignInWithEmailAndPasswordPressed extends SignInFormEvent {}
