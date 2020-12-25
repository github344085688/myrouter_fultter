import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final arguments;
  String title;
  SearchPage({this.title="表单",this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("搜索页面"),
      ) ,
      body: Text("搜索页面内容区域${arguments != null ? arguments['id'] : '0'}"),
    );
  }
}