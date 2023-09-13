import 'package:flutter/material.dart';
import 'package:hermanos_assignment/auth/data_layer/data_source/fetch_result.dart';
import 'package:hermanos_assignment/auth/domain_layer/entities/colors.dart';
import 'package:hermanos_assignment/auth/presentation_layer/pages/home_page.dart';
import 'package:hermanos_assignment/auth/presentation_layer/widgets/textstyle.dart';
import 'package:hermanos_assignment/auth/presentation_layer/widgets/widgets_functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FetchResult fetchResult = FetchResult();

  // ignore: unused_field
  String _userName = "";
  // ignore: unused_field
  String _password = "";
  // ignore: unused_field
  bool _isLoading = false;

  // ignore: unused_field
  bool _obscureText = true;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: dominant,
          body: SingleChildScrollView(
            child: centeredView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    space(height: 20),

                    Text(
                      "Log In",
                      style: headingLarge(),
                    ),

                    space(height: 8),

                    Text("Access your account", style: text(secondary70)),

                    space(height: 32),

                    space(height: 20),

                    TextFormField(
                      cursorColor: secondary,
                      style: text(secondary),
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Your Username',
                      ),
                      onChanged: (val) {
                        setState(() {
                          _userName = val;
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "You forget to enter your Username!";
                        } else {
                          return null;
                        }
                      },
                    ),

                    space(height: 20),

                    TextFormField(
                      cursorColor: secondary,

                      obscureText: _obscureText,

                      style: text(secondary),
                      decoration: textInputDecoration.copyWith(
                          labelText: 'Enter your password',
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: secondary,
                              ))),

                      keyboardType: TextInputType.emailAddress,

                      textInputAction: TextInputAction.done,

                      onChanged: (val) {
                        setState(() {
                          _password = val;
                        });
                      },

                      //Validator
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Password must be atleast 6 characters!";
                        } else {
                          return null;
                        }
                      },
                    ),

                    space(height: 32),

                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              logingIn();
                            }
                          },
                          style: primaryButtonStyle,
                          child: _isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: dominant,
                                    strokeWidth: 2.5,
                                  ))
                              : Text("Log In", style: text(dominant))),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  logingIn() async {
    setState(() {
      _isLoading = true;
    });

    await fetchResult.login(_userName, _password).then((value) {
      if (value) {
        setState(() {
          _isLoading = false;
          nextScreenReplace(context, const HomePage());
        });
      } else {
        setState(() {
          _isLoading = false;
          showSnackbar(context, Colors.red, 'Invalid credentials!');
        });
      }
    });
  }
}
