import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streetwyze/app/app_widget.dart';
import 'package:streetwyze/blocs/authentication/authentication_bloc.dart';
import 'package:streetwyze/blocs/authentication/authentication_event.dart';
import 'package:streetwyze/config/bloc_delegate.dart';
import 'package:streetwyze/repository/user_repo.dart';


class App {
  App();

  void run(runApp)  async{
     BlocSupervisor.delegate = SimpleBlocDelegate();
    UserRepository userRepository = UserRepository();
    runApp(
      BlocProvider<AuthenticationBloc>(
        create: (context) {
          return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted());
        },
        child: AppWidget(userRepository: userRepository),
      ),
    );
  }
}
