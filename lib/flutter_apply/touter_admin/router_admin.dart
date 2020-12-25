import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'explain.dart';
class RouterAdmin extends StatefulWidget{
  const RouterAdmin ({Key key}):super(key:key);

  @override
  _RouterAdmin createState()=> _RouterAdmin();
}

class _RouterAdmin extends State<RouterAdmin>{

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Markdown(
          data: ROUTERADMIN,
        )
  );

}