import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'explain.dart';
class ExceptionHandling extends StatefulWidget{
  const ExceptionHandling ({Key key}):super(key:key);

  @override
  _ExceptionHandling createState()=> _ExceptionHandling();
}

class _ExceptionHandling extends State<ExceptionHandling>{

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Markdown(
          data: EXCEPTIONHANDLING,
        )
  );

}