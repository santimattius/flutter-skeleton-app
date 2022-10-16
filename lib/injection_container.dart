import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_skeleton_app/features/authentication/application/authentication_bloc.dart';
import 'package:flutter_skeleton_app/features/authentication/application/sign_in/sign_in_form_bloc.dart';
import 'package:flutter_skeleton_app/features/authentication/domain/authentication_facade.dart';
import 'package:flutter_skeleton_app/features/authentication/infrastructure/firebase_authentication_facade.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final serviceLocator = GetIt.instance;

//Dependencies definitions
Future<void> init() async {
  serviceLocator.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(serviceLocator()));
  serviceLocator
      .registerFactory<SignInFormBloc>(() => SignInFormBloc(serviceLocator()));

  serviceLocator.registerLazySingleton<AuthenticationFacade>(
      () => FirebaseAuthFacade(serviceLocator(), serviceLocator()));
  //Firebase auth provide
  serviceLocator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
