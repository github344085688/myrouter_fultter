import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPreference{
  static Future<String> get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key) ? prefs.getString(key) : null;
  }

  static Future<bool> set(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

//删除数据
  static Future<bool> deleteData<T>(String key) async {
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


/**
 * SharedPreferences轻量级存储类，以键值对的形式保存设置，属性和数据。
 * 在pubspec.yaml 导入库
 * dependencies:
    shared_preferences: ^0.5.1+1

 * sharedPreferences.setXXX(key, value);//没有该key是添加键值对，有该key时修改对应的值
 * sharedPreferences.get(key);//获取key对应的值
 * sharedPreferences.remove(key);//清除指定key
 * sharedPreferences.clear();//清除所有
 * sharedPreferences.getKeys();获取所有的key
 */
/**
body: ListView(
children:
[            MyRowText("SharedPreferences", () async {
SharedPreferences sharedPreferences = await SharedPreferences
    .getInstance();
sharedPreferences.setString(
"name", "xiaoming"); //没有该key是添加键值对，有该key时修改对应的值
sharedPreferences.setString(
"age", "18"); //没有该key是添加键值对，有该key时修改对应的值

for (String key in sharedPreferences.getKeys()) {
debugPrint("所有的key分别为： $key");
}
debugPrint("获取存储的值：name= ${sharedPreferences.get("name")}");
debugPrint("获取存储的值：age= ${sharedPreferences.get("age")}");

sharedPreferences.setString("name", "lisi");

debugPrint("获取修改后存储的值：name= ${sharedPreferences.get("name")}");

sharedPreferences.remove("name"); //清除指定key
debug("获取删除后的值：name= ${sharedPreferences.get("name")}");

sharedPreferences.clear(); //清除所有
debugPrint("获取清除所有后的值：name= ${sharedPreferences.get("name")}");
}),
],
),
    */
