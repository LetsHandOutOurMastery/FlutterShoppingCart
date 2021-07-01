import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/bloc/authentication_bloc.dart';
import 'package:shoppingcart/config/size_config.dart';
import 'package:shoppingcart/repository/user_repository.dart';
import 'package:shoppingcart/screens/sign_in/components/signin_form.dart';

import '../../constants.dart';
import 'components/bloc/signin_bloc.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  final UserRepository userRepository;

  SignInScreen({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
            color: kPrimaryColor
        ),
        backgroundColor: kBackgroundColor,
        title: Text("Sign In",
        style: TextStyle(
          color: kSecondaryColor
        ),),

      ),
      backgroundColor:kBackgroundColor,
      body:BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: Body(),
      ),
    );
  }
}
