import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streetwyze/blocs/Login/login.dart';
import 'package:streetwyze/config/Constants.dart';
import 'package:streetwyze/helpers/CustomWidgets/CustomContainers.dart';
import 'package:streetwyze/helpers/CustomWidgets/RowWidgets.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  VoidCallback onCountSelected;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: AppConstants.myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _onLoginButtonPressed() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter required fields'),
            backgroundColor: Colors.red,
          ),
        );
      });
    } else {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  _onForgotPressed() {
    print('sahi tu chal rha forgot');
  }

  Future delayedSnakeBar(context, String message) async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginFailure) {
          //delayedSnakeBar(context, 'message');
        }

        return Form(
          child: Container(
            width: AppConstants.screenWidth(context),
            height: AppConstants.screenHeight(context),
            decoration: AppTheme.bgDecoration(),
            child: SingleChildScrollView(
              physics: new ClampingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Center(
                    child: CustomContainers.logoContainer(),
                  ),
                  Center(
                    child: CustomContainers.titleContainer(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: CustomContainers.swipingTab(_tabController),
                  ),
                  Container(
                    height: 180,
                    child: CustomContainers.customTabView(
                        _tabController, _emailController, _passwordController),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Container(
                      child: RowWidgets.loginForgotBtns(
                          _onLoginButtonPressed, _onForgotPressed),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
