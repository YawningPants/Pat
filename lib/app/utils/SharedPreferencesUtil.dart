import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static SharedPreferences _instance;
  static SharedPreferences get instance => _instance;

  bool get isReady => _instance != null;

  static Future<void> init() async {
    _instance ??= await SharedPreferences.getInstance();
  }
}
