import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, GoogleAuthProvider, FirebaseException;

import 'package:flutter_skeleton_app/features/authentication/domain/authentication_facade.dart';
import 'package:flutter_skeleton_app/features/authentication/domain/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../domain/authentication_failure.dart';
import '../domain/value_objects.dart';

class FirebaseAuthFacade implements AuthenticationFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Either<AuthenticationFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr);
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(AuthenticationFailure.emailAlreadyInUse());
      } else {
        return left(AuthenticationFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthenticationFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr);
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        return left(AuthenticationFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(AuthenticationFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthenticationFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(AuthenticationFailure.cancelledByUser());
      }

      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
          idToken: googleAuthentication.idToken,
          accessToken: googleAuthentication.accessToken);

      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((value) => right(unit));
    } on FirebaseException catch (_) {
      return left(AuthenticationFailure.serverError());
    }
  }

  @override
  Option<User> getSignedInUser() =>
      optionOf(_firebaseAuth.currentUser == null
          ? null
          : User(UniqueId.formUniqueString(_firebaseAuth.currentUser?.uid)));

  @override
  Future<void> signOut() =>
      Future.wait([_googleSignIn.signOut(), _firebaseAuth.signOut()]);
}
