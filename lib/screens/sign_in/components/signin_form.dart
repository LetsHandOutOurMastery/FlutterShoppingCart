import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/api/api_call_repository.dart';
import 'package:shoppingcart/components/custom_surfix_icon.dart';
import 'package:shoppingcart/components/form_error.dart';
import 'package:shoppingcart/screens/forgot_password/forgot_password_screen.dart';

import '../../../constants.dart';
import '../../../config/size_config.dart';
import 'bloc/signin_bloc.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];
  final _repository = MagentoRepository();
  bool isLoading = false;
  Future<String> loginResponseFuture;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
          username: email,
          password: password,
        ));
      }
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFaliure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  buildEmailFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildPasswordFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Row(
                    children: [
                      Theme(
                        data:
                        ThemeData(unselectedWidgetColor: kSecondaryColor),
                        child: Checkbox(
                          value: remember,
                          activeColor: kSecondaryColor,
                          checkColor: kPrimaryColor,
                          onChanged: (value) {
                            setState(() {
                              remember = value;
                            });
                          },
                        ),
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(color: kSecondaryColor),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => ForgotPasswordScreen()),
                            ),
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                              color: kSecondaryColor,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  FormError(errors: errors),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.width * 0.22,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: kSecondaryColor,
                        onPressed: state is! LoginLoading
                            ? _onLoginButtonPressed
                            : null,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: kPrimaryColor
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: state is LoginLoading
                        ? CircularProgressIndicator()
                        : null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      style: TextStyle(color: kPrimaryColor),
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintStyle: TextStyle(color: kPrimaryColor),
        labelText: 'Password',
        labelStyle:  TextStyle(color: kPrimaryColor),
        hintText: "Enter your Password",
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        fillColor: kPrimaryColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
      controller: _passwordController,
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      style: TextStyle(color: kPrimaryColor),
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          hintStyle: TextStyle(color: kPrimaryColor),
          labelText: 'Username',
          labelStyle:  TextStyle(color: kPrimaryColor),
          hintText: "Enter your Username",
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
          fillColor: kPrimaryColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
      controller: _usernameController,
    );
  }

  Container getContainer() {
   return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.width * 0.12,
    );
  }
}
