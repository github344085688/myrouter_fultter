import 'package:flutter/material.dart';
import './pages/parent.dart';

class Communication extends StatefulWidget {
  const Communication({Key key}) : super(key: key);

  @override
  _Communication createState() => _Communication();
}

class _Communication extends State<Communication>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Parent(),
    );
  }
  // TODO: implement widget
  // ParentChildCommunication get widget => super.widget;
}