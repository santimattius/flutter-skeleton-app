abstract class AuthenticationFailure {

  factory AuthenticationFailure.cancelledByUser(){
    return CancelledByUser();
  }

  factory AuthenticationFailure.serverError(){
    return ServerError();
  }

  factory AuthenticationFailure.emailAlreadyInUse() {
    return EmailAlreadyInUse();
  }

  factory AuthenticationFailure.invalidEmailAndPasswordCombination() {
    return InvalidEmailAndPasswordCombination();
  }
}

class CancelledByUser implements AuthenticationFailure {}

class ServerError implements AuthenticationFailure {}

class EmailAlreadyInUse implements AuthenticationFailure {}

class InvalidEmailAndPasswordCombination implements AuthenticationFailure {}
