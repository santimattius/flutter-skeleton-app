import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import '../../application/sign_in/sign_in_form_bloc.dart';import '../decorator/input_decorator.dart';import 'auth_background.dart';import 'card_container.dart';class SignInForm extends StatelessWidget {  @override  Widget build(BuildContext context) {    return BlocConsumer<SignInFormBloc, SignInFormState>(      builder: (context, state) {        return AuthenticationBackground(          child: SingleChildScrollView(            child: Column(              children: [                const SizedBox(height: 250),                CardContainer(                  child: Column(                    children: [                      const SizedBox(height: 10),                      Text(                        'Sign In',                        style: Theme.of(context).textTheme.headline4,                      ),                      buildForm(context, state),                      const SizedBox(height: 30),                    ],                  ),                ),                const SizedBox(height: 10),                TextButton(                  onPressed: () {                    context                        .read<SignInFormBloc>()                        .add(SignInFormEvent.signInWithGooglePressed());                  },                  style: ButtonStyle(                    overlayColor: MaterialStateProperty.all(                      Colors.indigo.withOpacity(0.1),                    ),                    shape: MaterialStateProperty.all(const StadiumBorder()),                  ),                  child: const Text(                    'SIGN IN WITH GOOGLE',                    style: TextStyle(fontSize: 18),                  ),                ),                const SizedBox(height: 50),              ],            ),          ),        );      },      listener: (context, state) {        state.authFailureOrSuccessOption.fold(          () => {},          (either) => either.fold(            (failure) => {},            (_) {},          ),        );      },    );  }  Form buildForm(BuildContext context, SignInFormState state) {    return Form(      autovalidateMode: state.showErrorMessages          ? AutovalidateMode.always          : AutovalidateMode.disabled,      child: Column(        children: [          const SizedBox(            height: 8,          ),          TextFormField(            keyboardType: TextInputType.emailAddress,            decoration: authInputDecoration(              context: context,              hintText: 'user@example.com',              labelText: 'Email',              prefixIcon: Icons.email_outlined,            ),            onChanged: (value) => context                .read<SignInFormBloc>()                .add(SignInFormEvent.emailChanged(value)),            validator: (_) =>                context.read<SignInFormBloc>().state.emailAddress.value.fold(                      (failure) => null,                      (_) => null,                    ),            autocorrect: false,          ),          const SizedBox(            height: 8,          ),          TextFormField(            obscureText: true,            keyboardType: TextInputType.emailAddress,            decoration: authInputDecoration(              context: context,              hintText: '*****',              labelText: 'Password',              prefixIcon: Icons.lock_outline,            ),            autocorrect: false,            validator: (_) =>                context.read<SignInFormBloc>().state.password.value.fold(                      (failure) => null,                      (_) => null,                    ),            onChanged: (value) => context                .read<SignInFormBloc>()                .add(SignInFormEvent.passwordChanged(value)),          ),          const SizedBox(            height: 8,          ),          Row(            children: [              Expanded(                child: TextButton(                  onPressed: () {                    context.read<SignInFormBloc>().add(SignInFormEvent                        .signInWithEmailAndPasswordPressed());                  },                  child: const Text('SIGN IN'),                ),              ),              Expanded(                child: TextButton(                  onPressed: () {                    context.read<SignInFormBloc>().add(SignInFormEvent                        .registerWithEmailAndPasswordPressed());                  },                  child: const Text('REGISTER'),                ),              )            ],          ),        ],      ),    );  }}