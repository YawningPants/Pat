import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:pat/pages/framework.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WatchdogPage extends StatefulWidget {
  @override
  _WatchdogPageState createState() => _WatchdogPageState();
}

class _WatchdogPageState extends State<WatchdogPage> {

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          AutoOrientation.portraitUpMode();
        } else {
          AutoOrientation.landscapeAutoMode();
        }
        return FrameworkPage();
      },
    );
  }
}