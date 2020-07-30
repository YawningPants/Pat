import 'package:flutter/material.dart';

class NavigatorUtil {
  static Future goToPage({
    BuildContext context,
    Widget page,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
