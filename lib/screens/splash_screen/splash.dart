import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoppingcart/constants.dart';
import 'package:shoppingcart/repository/user_repository.dart';
import 'package:shoppingcart/screens/sign_in/sign_in_screen.dart';
import 'package:shoppingcart/config/size_config.dart';
import 'package:shoppingcart/screens/splash_screen/components/body.dart';


class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SplashStateful();
  }
}

class SplashStateful extends StatefulWidget {
  const SplashStateful({Key key}) : super(key: key);

  @override
  _SplashStatefulState createState() => _SplashStatefulState();
}

class _SplashStatefulState extends State<SplashStateful> {

  @override
  void initState() {
    // TODO: implement initState
    final userRepository = UserRepository();
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    SignInScreen(userRepository: userRepository)
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kBackgroundColor,
      body: Body(),
    );
  }
}


