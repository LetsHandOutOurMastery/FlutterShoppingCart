import 'package:flutter/widgets.dart';
import 'package:shoppingcart/repository/user_repository.dart';
import 'package:shoppingcart/screens/splash_screen/splash.dart';
import 'package:shoppingcart/screens/cart/cart_screen.dart';
import 'package:shoppingcart/screens/complete_profile/complete_profile_screen.dart';
import 'package:shoppingcart/screens/details/details_screen.dart';
import 'package:shoppingcart/screens/forgot_password/forgot_password_screen.dart';
import 'package:shoppingcart/screens/home/home_screen.dart';
import 'package:shoppingcart/screens/otp/otp_screen.dart';
import 'package:shoppingcart/screens/profile/profile_screen.dart';
import 'package:shoppingcart/screens/sign_in/sign_in_screen.dart';
import 'package:shoppingcart/screens/sign_up/sign_up_screen.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {

  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(userRepository: UserRepository(),),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
