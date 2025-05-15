import 'package:flutter_revision/core/shared_preference/shared_preferences_service.dart';

class CheckUserLogin {
  static const String isLoggedInKey = 'is_logged_in';

  static bool? isLoggedIn() {
    bool? value = StorageService().getBool(isLoggedInKey);
    print(value);
    return value;
  }

  static Future<void> setLogin(bool value) async {
    final prefs = await StorageService().saveBool(isLoggedInKey, value);
    return prefs;
  }
}
