import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton_app/features/authentication/domain/authentication_failure.dart';

import '../../domain/authentication_facade.dart';
import '../../domain/value_objects.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final AuthenticationFacade _authenticationFacade;

  SignInFormBloc(this._authenticationFacade)
      : super(SignInFormState.initial()) {
    on<SignInFormEvent>(
      (event, emit) => emit.onEach<SignInFormState>(
        mapEventToState(event),
        onData: (state) {
          emit(state);
        },
      ),
    );
  }

  Stream<SignInFormState> mapEventToState(SignInFormEvent event) async* {
    switch (event.runtimeType) {
      case EmailChanged:
        yield state.copyWith(
            emailAddress: EmailAddress((event as EmailChanged).email),
            authFailureOrSuccessOption: none());

        break;
      case PasswordChanged:
        yield state.copyWith(
          password: Password((event as PasswordChanged).password),
          authFailureOrSuccessOption: none(),
        );
        break;
      case RegisterWithEmailAndPasswordPressed:
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          _authenticationFacade.registerWithEmailAndPassword,
        );
        break;
      case SignInWithGooglePressed:
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        );
        final failureOrSuccess = await _authenticationFacade.signInWithGoogle();
        yield state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(failureOrSuccess));
        break;
      case SignInWithEmailAndPasswordPressed:
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          _authenticationFacade.signInWithEmailAndPassword,
        );
        break;
    }
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthenticationFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    })
        forwardedCall,
  ) async* {
    Either<AuthenticationFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }
    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
