import 'package:flutter/material.dart';
import 'package:shoppingcart/components/socal_card.dart';
import 'package:shoppingcart/constants.dart';
import 'package:shoppingcart/config/size_config.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Register Account", style:  TextStyle(
                    color: kPrimaryColor,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kSecondaryColor
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing your confirm that you agree \nwith our Terms and Conditions',

                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kPrimaryColor
                  ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
