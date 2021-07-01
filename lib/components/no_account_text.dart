import 'package:flutter/material.dart';
import 'package:shoppingcart/screens/sign_up/sign_up_screen.dart';

import '../constants.dart';
import '../config/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16),
            color: kSecondaryColor
          ),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SignUpScreen()),
              ),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
