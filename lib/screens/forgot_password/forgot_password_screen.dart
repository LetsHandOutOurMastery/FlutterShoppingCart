import 'package:flutter/material.dart';
import 'package:shoppingcart/constants.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: kPrimaryColor
        ),
        title: Text(
          "Forgot Password",
          style: TextStyle(color: kSecondaryColor),
        ),
        backgroundColor: kBackgroundColor,
      ),
      backgroundColor: kBackgroundColor,
      body: Body(),
    );
  }
}
