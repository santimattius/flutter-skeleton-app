import 'package:dartz/dartz.dart';

import 'authentication_failure.dart';
import 'user.dart';
import 'value_objects.dart';

abstract class AuthenticationFacade {
  Option<User> getSignedInUser();

  Future<Either<AuthenticationFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthenticationFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthenticationFailure, Unit>> signInWithGoogle();

  Future<void> signOut();
}
