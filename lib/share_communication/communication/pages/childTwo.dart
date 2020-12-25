import 'package:flutter/material.dart';
import 'childOne.dart';
// import '../common/eventBus.dart';
import 'dart:async';
// import 'package:flutter/cupertino.dart';
// GlobalKey<State> childKey = GlobalKey();
class ChildTwo extends StatefulWidget {
  ChildTwo({Key key, this.dataTwo, this.callBack}) : super(key: key);
  final callBack;
  String dataTwo;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ChildTwoState();
  }
}
class ChildTwoState extends State<ChildTwo>{
  GlobalKey<ChildOneState> _globalKey = GlobalKey<ChildOneState>();
  String data = '';
  StreamSubscription subscription;
  String inputText;
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    data = widget.dataTwo;
    super.initState();
  }

  void _onChanged(String value){
    setState(() {
      inputText = value;
    });
  }
  void transA(){
    widget.callBack('$inputText');
  }
  void transB(){
    _globalKey.currentState.testFun('20');
    // eventBus.fire(new TransEvent('$inputText'));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color:Colors.blue[100]
      ),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.only(bottom: 15),
              child: new Text('child2'),
            ),
            new Container(
              padding: new EdgeInsets.only(bottom: 20),
              child: new Text('child2 : farentValue=>$data'),
            ),
            new Container(
              margin: new EdgeInsets.only(bottom: 40),
              child: new TextField(
                controller: controller,
                decoration: (new InputDecoration(labelText: 'child2:请输入你要发送的值')),
                onChanged: _onChanged,
              ),
            ),
            new Container(
              child: new RaisedButton(onPressed: transA,child: new Text('child2:to 父组件 = callBack')),
            ),
            new Container(
              child: new RaisedButton( onPressed: () {
                _globalKey.currentState.testFun('20');
              },child: new Text('child2:to 兄弟组件')),
            )
          ],
        ),
      ),
    );
  }
}