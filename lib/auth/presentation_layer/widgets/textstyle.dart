import 'package:flutter/material.dart';
import 'package:hermanos_assignment/auth/domain_layer/entities/colors.dart';

TextStyle headingLarge() {
  return const TextStyle(
      fontFamily: 'Inter Black', fontSize: 24, color: secondary);
}

TextStyle headingMedium() {
  return const TextStyle(
      fontFamily: 'Inter Bold', fontSize: 20, color: secondary);
}

TextStyle headingSmall() {
  return const TextStyle(
      fontFamily: 'Inter Bold', fontSize: 18, color: secondary);
}

TextStyle text(Color color) {
  return TextStyle(fontFamily: 'Inter Regular', fontSize: 16, color: color);
}

TextStyle textBold(Color color) {
  return TextStyle(fontFamily: 'Inter Bold', fontSize: 16, color: color);
}

TextStyle textDes(Color color) {
  return TextStyle(fontFamily: 'Inter Light', fontSize: 14, color: color);
}
