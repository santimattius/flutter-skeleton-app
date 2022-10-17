part of 'sign_in_form_bloc.dart';

class SignInFormState extends Equatable {
  final EmailAddress emailAddress;
  final Password password;
  final bool showErrorMessages;
  final bool isSubmitting;
  final Option<Either<AuthenticationFailure, Unit>> authFailureOrSuccessOption;

  const SignInFormState({
    required this.emailAddress,
    required this.password,
    required this.showErrorMessages,
    required this.isSubmitting,
    required this.authFailureOrSuccessOption,
  });

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );

  @override
  List<Object?> get props => [
        emailAddress,
        password,
        showErrorMessages,
        isSubmitting,
        authFailureOrSuccessOption
      ];

  SignInFormState copyWith(
      {EmailAddress? emailAddress,
      Password? password,
      bool? showErrorMessages,
      bool? isSubmitting,
      Option<Either<AuthenticationFailure, Unit>>?
          authFailureOrSuccessOption}) {
    return SignInFormState(
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
        showErrorMessages: showErrorMessages ?? this.showErrorMessages,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        authFailureOrSuccessOption:
            authFailureOrSuccessOption ?? this.authFailureOrSuccessOption);
  }
}
