// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  final Future<SharedPreferences> sharedPreference;

  PreferenceHelper(this.sharedPreference);

  static const ACCESS_TOKEN = "";

  Future<String> get accessToken async {
    final pref = await sharedPreference;
    return pref.getString(ACCESS_TOKEN) ?? "";
  }

  void setAccessToken(String token) async {
    final pref = await sharedPreference;
    pref.setString(ACCESS_TOKEN, token);
  }
}
