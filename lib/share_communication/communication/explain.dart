
const String PARENTCHILDCOMMUNICATION = '''

## callback 回调通信
 父组件调用子组件就用callBack 
```
new childWidgetOne(dataTwo: dataTwo,callBack: (value)=>onChanged(value)),
// new childWidgetThree(dataTwo: dataTwo,callBack: (value)=>onChanged(value)),

childWidgetTwo({Key key, this.dataTwo, this.callBack}) : super(key: key);

void transA(){
    widget.callBack('inputText');
  } 
  
  new RaisedButton(onPressed: transA,child: new Text('child2:to 父组件 = callBack')),
  new RaisedButton(onPressed: transA,child: new Text('child2:to 父组件 = callBack')),
```
1

而子组件调用子组件除了eventBus  的通知 (eventBus 应用场景适合组件太多 父子信息交互过于繁琐的时候 )  还可以 用GlobalKey() 
 GlobalKey<childOneState> _globalKey = GlobalKey<childOneState>();
''';
