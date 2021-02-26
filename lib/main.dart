import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/my_main_app.dart';
import 'dart:io';
import 'package:flutter/services.dart';
void main(){
  if(Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  //Flutter 设置状态栏透明
  return runApp(MyMainApp());

}

