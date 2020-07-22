import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:streetwyze/blocs/Login/login_events.dart';
import 'package:streetwyze/blocs/Login/login_states.dart';
import 'package:streetwyze/repository/user_repo.dart';
import 'package:streetwyze/blocs/authentication/authentication.dart';

// Worked on this

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      if (event.username.isEmpty) {
        yield LoginFailure(error: "Empty USername");
      } else {
        yield LoginInProgress();
      }

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
