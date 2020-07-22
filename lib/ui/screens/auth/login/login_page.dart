import 'package:flutter/material.dart';
import 'package:streetwyze/blocs/Login/login.dart';
import 'package:streetwyze/blocs/authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streetwyze/repository/user_repo.dart';
import 'package:streetwyze/ui/screens/auth/login/login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(),
      ),
    );
  }
}
