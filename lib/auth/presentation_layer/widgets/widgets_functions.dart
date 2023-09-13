import 'package:flutter/material.dart';
import 'package:hermanos_assignment/auth/domain_layer/entities/colors.dart';
import 'package:hermanos_assignment/auth/presentation_layer/widgets/textstyle.dart';

Widget space({required double height}) {
  return SizedBox(
    height: height,
  );
}

Widget centeredView({required child}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
    child: child,
  );
}

var textInputDecoration = InputDecoration(
    labelStyle: text(secondary70).copyWith(fontSize: 14),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: secondary50,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
      width: 1.5,
      color: secondary,
    )),

    // errorBorder: OutlineInputBorder
    // (
    //   borderRadius: BorderRadius.circular(30.0),
    //   borderSide: const BorderSide
    //   (
    //     color: Color(0xFFF47979),
    //     width: 1.9
    //   )
    // ),

    // focusedErrorBorder: OutlineInputBorder
    // (
    //   borderRadius: BorderRadius.circular(30.0),
    //   borderSide: const BorderSide
    //   (
    //     color: Color(0xFFF47979),
    //     width: 1.9
    //   )
    // ),

    errorStyle: textDes(Colors.red.shade400).copyWith(fontSize: 12));

// Sign In, Log In , Save Buttons
ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: callToAction,
  shadowColor: callToAction.withOpacity(0.5),
  minimumSize: const Size.fromHeight(40),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
  elevation: 2,
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

//Replace the Next Screen
void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void showSnackbar(context, textColor, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message, style: text(textColor)),
    backgroundColor: dominant,
    duration: const Duration(seconds: 3),
    action: SnackBarAction(
      label: "Ok",
      onPressed: () {},
      textColor: secondary,
      backgroundColor: dominant,
    ),
  ));
}
