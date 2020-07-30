import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarUtil {
  static void setTransparentStatusBar() {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
