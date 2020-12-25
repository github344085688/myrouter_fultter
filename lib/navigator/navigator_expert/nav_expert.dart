import 'package:flutter/material.dart';
class NavigatorAdvanced extends StatefulWidget{
  const NavigatorAdvanced({Key key}):super(key:key);
  @override
  _NavigatorAdvanced createState()=>_NavigatorAdvanced();
}

class _NavigatorAdvanced extends State<NavigatorAdvanced>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            // 点击跳转到第二个route
          },
        ),
      ),
    );
  }
}