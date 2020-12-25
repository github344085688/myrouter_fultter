import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'explain.dart';
class FlutterWidget extends StatefulWidget{
  const FlutterWidget ({Key key}):super(key:key);

  @override
  _FlutterWidget createState()=> _FlutterWidget();
}

class _FlutterWidget extends State<FlutterWidget>{

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Markdown(
          data: FLUTTERWIDGET,
        )
  );

}