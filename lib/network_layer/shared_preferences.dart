import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({
    required String key,
    required dynamic value,
  }) async {
    if (value.runtimeType == bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setString(key, value);
    }
  }

  static String? getStringData({required String key}) {
    return sharedPreferences.getString(
      key,
    );
  }

  static bool? getBoolData({required String key}) {
    return sharedPreferences.getBool(
      key,
    );
  }
}
