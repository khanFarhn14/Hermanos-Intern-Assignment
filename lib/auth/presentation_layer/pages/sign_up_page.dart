import 'package:flutter/material.dart';
import 'package:hermanos_assignment/auth/domain_layer/entities/colors.dart';
import 'package:hermanos_assignment/auth/presentation_layer/pages/login_page.dart';
import 'package:hermanos_assignment/auth/presentation_layer/widgets/textstyle.dart';
import 'package:hermanos_assignment/auth/presentation_layer/widgets/widgets_functions.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // ignore: unused_field
  String _userName = "";
  // ignore: unused_field
  String _userEmail = "";
  // ignore: unused_field
  String _password = "";
  bool _obscureText = true;
  bool _isLoading = false;

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
                      "Sign Up",
                      style: headingLarge(),
                    ),
                    space(height: 8),
                    Text("Create your account", style: text(secondary70)),
                    space(height: 32),
                    TextFormField(
                      cursorColor: secondary,
                      style: text(secondary),
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Your Name',
                      ),
                      onChanged: (val) {
                        setState(() {
                          _userName = val;
                        });
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      validator: (val) {
                        final usernameRegExp = RegExp(r'^[a-zA-Z ]{2,26}$');
                        if (val!.isEmpty) {
                          return "You forget to enter your Name!";
                        } else if (!usernameRegExp.hasMatch(val)) {
                          return "Please enter valid Name!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    space(height: 20),
                    TextFormField(
                      cursorColor: secondary,
                      style: text(secondary),
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Your Email',
                      ),
                      onChanged: (val) {
                        setState(() {
                          _userEmail = val;
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: (val) {
                        final usernameRegExp =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (val!.isEmpty) {
                          return "You forget to enter your Email!";
                        } else if (!usernameRegExp.hasMatch(val)) {
                          return "Please enter valid Email!";
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

                      keyboardType: TextInputType.visiblePassword,

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
                              // signingUp();
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
                              : Text("Sign Up", style: textBold(dominant))),
                    ),
                    space(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',
                            style: textDes(secondary70)),
                        TextButton(
                            onPressed: () =>
                                nextScreen(context, const LoginPage()),
                            child:
                                Text("Log In", style: textBold(callToAction)))
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
