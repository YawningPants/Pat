import 'package:flutter/material.dart';

class FontUtil {
  static TextStyle get normalUnfocusTextStyle {
    return TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.grey,
      fontSize: 14.5,
    );
  }

  static TextStyle get normalTextStyle {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.5,
    );
  }

  static TextStyle get normalBoldTextStyle {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.5,
    );
  }

  static TextStyle get smallTextStyle {
    return TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.grey,
      fontSize: 12,
    );
  }

  static TextStyle get h1Style {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }

  static TextStyle get h2Style {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
    );
  }
}
