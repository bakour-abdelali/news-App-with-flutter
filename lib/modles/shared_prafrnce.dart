import 'package:shared_preferences/shared_preferences.dart';

class ShaerdPrafrnce {
  static SharedPreferences? sharedPreferences;
  static initData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences);
  }

  static Future<bool> putData(
      {required String key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getData({required String key}) {
    return sharedPreferences!.getBool(key);
  }
}
