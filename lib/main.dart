import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/repository/user_repository.dart';
import 'package:shoppingcart/screens/splash_screen/splash.dart';
import 'package:shoppingcart/screens/home/home_screen.dart';
import 'package:shoppingcart/screens/sign_in/sign_in_screen.dart';
import 'package:shoppingcart/theme.dart';
import 'package:shoppingcart/routes.dart';

import 'bloc/authentication_bloc.dart';
import 'components/loading_indicator.dart';


void main() {
  final userRepository = UserRepository();

  runApp(
      BlocProvider<AuthenticationBloc>(
        create: (context) {
          return AuthenticationBloc(
              userRepository: userRepository
          )..add(AppStarted());
        },
        child: App(userRepository: userRepository),
      )
  );
}

class App extends StatelessWidget {
  AuthenticationBloc _authenticationBloc;
  final UserRepository userRepository;


  App({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);


  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trendy Shopping',
      theme: theme(),
      home: Scaffold(
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationUninitialized) {
              return SplashScreen();
            }
            if (state is AuthenticationAuthenticated) {
              print('Redirect to Home screen');
              return HomeScreen();
            }
            if (state is AuthenticationUnauthenticated) {
              return SignInScreen(userRepository: userRepository);
            }
            return LoadingIndicator();
          },
        ),
      ),
    );
  }
}


