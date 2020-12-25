import 'package:flutter/material.dart';

class ChildOne extends StatefulWidget {
   final dynamic data;
   ChildOne({Key key,this.data}):super(key:key);

  @override
  ChildOneState createState()=>ChildOneState();
}

class ChildOneState extends State<ChildOne> {
  String data = '';
  void addCount(int x) {
    print('addCount----------$x');
  }
  @override
  void initState() {
    // TODO: implement initState
    // eventBus.on<TransEvent>().listen((TransEvent data) => show(data.text));

    super.initState();
  }
  void testFun(String test){
    print("____触发子组件");
    print("${test}");
  }
  void show(String val) {
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {

    final _textStyle = TextAlign.center;

    // TODO: implement build
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.only(bottom: 15),
              child: new Text('child1'),
            ),
            new Text('child2 value=>${widget.data}'),
            new Container(
              color: Colors.cyanAccent,
              width: 100,
              height: 20,
              padding: new EdgeInsets.only(top: 0),

              child: new Text('test',
               textAlign: TextAlign.left,
                style: new TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  fontSize: 20
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
