import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static Future<String> get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key) ? prefs.getString(key) : null;
  }

  static Future<bool> set(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<bool> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  static Future<T> getJsonObject<T>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonStr = prefs.getString(key);
    return jsonStr != null ? json.decode(jsonStr) : Map<String, dynamic>();
  }

  static Future<bool> setJsonObject<T>(String key, T jsonObject) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, json.encode(jsonObject));
  }
}
