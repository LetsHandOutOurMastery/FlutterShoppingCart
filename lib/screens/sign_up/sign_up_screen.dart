import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: kPrimaryColor
        ),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: Text(
          "Sign Up",
          style: TextStyle(color: kSecondaryColor),
        ),
      ),
      body: Body(),
      backgroundColor:kBackgroundColor,
    );
  }
}
