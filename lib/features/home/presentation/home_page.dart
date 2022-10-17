import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton_app/features/authentication/application/authentication_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state.runtimeType == Unauthenticated) {
                Navigator.pushReplacementNamed(context, '/sign_in');
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthenticationEvent.signedOut());
              },
            ),
          ),
          body: const Center(
            child: Text("Hello Flutter!"),
          ),
        ));
  }
}
