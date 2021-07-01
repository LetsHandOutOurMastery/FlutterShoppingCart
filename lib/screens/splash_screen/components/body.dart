import 'package:flutter/material.dart';
// This is the best practice
import 'package:shoppingcart/screens/splash_screen/components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SplashContent(),
      ),
    );
  }
}
