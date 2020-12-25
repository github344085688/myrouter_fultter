import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'explain.dart';

class LayoutFrapFlow extends StatefulWidget {
  const LayoutFrapFlow({Key key}) : super(key: key);

  @override
  _LayoutFrapFlow createState() => _LayoutFrapFlow();
}

class _LayoutFrapFlow extends State<LayoutFrapFlow> {
  final List<String> _chipNames = ['Hamilton','Lafayette','Mulligan','Laurens','Mulligan'];
  List<Widget> _generateList() {
    return _chipNames.map((item) => ButtonItem(text: item)).toList();
  }



  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child:
          Column(
            children: <Widget>[
              WidgetMarkdown(data: '''
> Row默认只有一行，如果超出屏幕不会折行
>通过Wrap和Flow来支持流式布局，将上例中的Row换成Wrap后溢出部分则会自动折行
```
Wrap({
    this.direction = Axis.horizontal,//主轴（mainAxis）的方向，默认为水平。
    this.alignment = WrapAlignment.start,//主轴方向上的对齐方式，默认为start。
    this.spacing = 0.0,//主轴方向上的间距。
    this.runAlignment = WrapAlignment.start,//run的对齐方式。run可以理解为新的行或者列，如果是水平方向布局的话，run可以理解为新的一行。
    this.runSpacing = 0.0,//run的间距。
    this.crossAxisAlignment = WrapCrossAlignment.start,//交叉轴（crossAxis）方向上的对齐方式。
    this.textDirection,//文本方向。
    this.verticalDirection = VerticalDirection.down,//定义了children摆放顺序，默认是down，见Flex相关属性介绍。
    List<Widget> children = const <Widget>[],//
})
```
'''),

              Wrap(
                spacing: 8.0, // 主轴(水平)方向间距
                runSpacing: 4.0, // 纵轴（垂直）方向间距
                alignment: WrapAlignment.center, //沿主轴方向居中
                children: <Widget>[
                  new Chip(
                    avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                    label: new Text('Hamilton'),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
                    label: new Text('Lafayette'),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
                    label: new Text('Mulligan'),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                    label: new Text('Laurens'),
                  ),
                  WidgetMarkdown(data: '''
> 一般很少会使用Flow，因为其过于复杂
>通过Wrap和Flow来支持流式布局，将上例中的Row换成Wrap后溢出部分则会自动折行
```
Flow(
  delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
  children: <Widget>[
    new Container(width: 80.0, height:80.0, color: Colors.red,),
    new Container(width: 80.0, height:80.0, color: Colors.green,),
    new Container(width: 80.0, height:80.0, color: Colors.blue,),
    new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
    new Container(width: 80.0, height:80.0, color: Colors.brown,),
    new Container(width: 80.0, height:80.0,  color: Colors.purple,),
  ],
)
```
```
class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置  
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)  
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
         x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小  
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
```
'''),

                ],
              ),
            ],
          ),
        ),
      );
}

class ButtonItem extends StatelessWidget {
  ButtonItem({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.text),
      color: Theme.of(context).buttonColor,
      onPressed: () {},
    );
  }
}