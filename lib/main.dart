import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton_app/features/authentication/application/authentication_bloc.dart';
import 'package:flutter_skeleton_app/features/authentication/presentation/sign_in_page.dart';
import 'package:flutter_skeleton_app/features/splash/presentation/splash_page.dart';

import 'features/home/presentation/home_page.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as sl;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await sl.init();
  runApp(const ScaffoldApp());
}

class ScaffoldApp extends StatelessWidget {
  const ScaffoldApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<AuthenticationBloc>()
            ..add(AuthenticationEvent.authCheckRequested()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/sign_in': (context) => const SignInPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
