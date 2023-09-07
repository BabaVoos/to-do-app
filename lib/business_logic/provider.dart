import 'package:flutter/material.dart';

import '../network_layer/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String defaultLanguage = 'en';

  void changeThemeMode(ThemeMode themeMode) {
    this.themeMode = themeMode;
    CacheHelper.putData(key: 'theme', value: themeMode.name);
    notifyListeners();
  }

  void changeLanguage(String language) {
    defaultLanguage = language;
    CacheHelper.putData(key: 'lang', value: language);
    notifyListeners();
  }

  bool isArabic() {
    return CacheHelper.getStringData(key: 'lang') == 'ar';
  }

  bool isDark() {
    return CacheHelper.getStringData(key: 'theme') == 'dark';
  }

  ThemeMode setThemeMode() {
    if (isDark()) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  String changeSplashScreen() {
    if (isDark()) {
      return 'assets/images/dark_splash.png';
    } else {
      return 'assets/images/light_splash.png';
    }
  }
}
