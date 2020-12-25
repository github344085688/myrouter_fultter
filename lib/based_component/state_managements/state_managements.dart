import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'explain.dart';
class StateManagements extends StatefulWidget{
  const StateManagements ({Key key}):super(key:key);

  @override
  _StateManagements createState()=> _StateManagements();
}

class _StateManagements extends State<StateManagements>{

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Markdown(
          data: STATEMANAGEMENTS,
        )
  );

}