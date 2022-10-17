import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton_app/injection_container.dart';

import '../application/sign_in/sign_in_form_bloc.dart';
import 'wigets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SignInFormBloc>(
        create: (context) => serviceLocator<SignInFormBloc>(),
        child: const SignInForm(),
      ),
    );
  }
}
