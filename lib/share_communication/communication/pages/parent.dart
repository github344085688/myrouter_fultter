import 'package:flutter/material.dart';
import 'childOne.dart';
import 'childTwo.dart';

class Parent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ParentState();
}

class ParentState extends State<Parent> {
  String data = "无";
  String dataTwo = "传递给组件2的值";

  void onChanged(val){
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Container(
            child: new Column(
              children: <Widget>[
                new ChildOne(data:this.data),
                new ChildTwo(dataTwo: dataTwo,callBack: (value)=>onChanged(value)),
                new Container(
                  padding: new EdgeInsets.only(bottom: 15),
                  child: new Text('父组件'),
                ),
                new Text('子组件2，传过来的值' + '$data'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
