import 'package:flutter/material.dart';
import 'package:shoppingcart/components/coustom_bottom_nav_bar.dart';
import 'package:shoppingcart/constants.dart';
import 'package:shoppingcart/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
