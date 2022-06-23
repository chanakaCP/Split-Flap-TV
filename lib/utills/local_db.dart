import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  static clearAll() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await setAccessToken('');
    await sharedPrefs.clear();
  }

  static setAccessToken(String playerId) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("access_token", playerId);
  }

  static Future<String?> getAccessToken() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String? lang = sharedPrefs.getString("access_token");
    return lang;
  }
}
