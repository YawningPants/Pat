import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:pat/app/utils/SharedPreferencesUtil.dart';

import 'package:pat/pages/watchdog.dart';

import 'package:pat/app/utils/status_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StatusBarUtil.setTransparentStatusBar();
  await SharedPreferencesUtil.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      home: WatchdogPage(),
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Theme.of(context).cardColor,
      ),
    );
  }
}