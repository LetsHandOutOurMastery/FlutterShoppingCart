import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../config/size_config.dart';

class SplashContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "TRENDY",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(65),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "SHOPPING",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(65),
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Image.asset(
          "assets/images/splash_logo.png",
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
