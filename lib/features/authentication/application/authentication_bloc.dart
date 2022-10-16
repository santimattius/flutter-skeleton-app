import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../domain/authentication_facade.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationFacade _authenticationFacade;

  AuthenticationBloc(this._authenticationFacade)
      : super(AuthenticationState.initial()) {
    on<AuthenticationEvent>((event, emit) async {
      emit(await mapEventToState(event));
    });
  }

  Future<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async {
    switch (event.runtimeType) {
      case AuthCheckRequested:
        final userOption = _authenticationFacade.getSignedInUser();
        return userOption.fold(
          () => AuthenticationState.unauthenticated(),
          (_) => AuthenticationState.authenticated(),
        );
      default:
        await _authenticationFacade.signOut();
        return AuthenticationState.unauthenticated();
    }
  }
}
