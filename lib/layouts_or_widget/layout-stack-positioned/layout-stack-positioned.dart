import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'explain.dart';

class LayoutStackPositioned extends StatefulWidget {
  const LayoutStackPositioned({Key key}) : super(key: key);

  @override
  _LayoutStackPositioned createState() => _LayoutStackPositioned();
}

class _LayoutStackPositioned extends State<LayoutStackPositioned> {
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: '''
##  层叠布局 Positioned
```
 Stack(
    //子组件对齐方式，同 Container 的 alignment 属性一样的，它指定的是所有子组件的对齐方式，所以建议在只有两个子组件的时候
    //使用，如果有三个及以上的子组件时，建议使用 Positioned 包裹子组件来决定子组件的位置，alignment 的可选值有：
    //AlignmentDirectional.topCenter：垂直靠顶部水平居中对齐
    //AlignmentDirectional.topRight：垂直靠顶部水平靠右对齐
    //AlignmentDirectional.centerLeft：垂直居中水平靠左对齐
    //AlignmentDirectional.center：垂直和水平居中都对齐
    //AlignmentDirectional.centerRight：垂直居中水平靠右对齐
    //AlignmentDirectional.bottomLeft：垂直靠底部水平靠左对齐
    //AlignmentDirectional.bottomCenter：垂直靠底部水平居中对齐
    //AlignmentDirectional.bottomRight：垂直靠底部水平靠右对齐
    //也可以像我一样指定具体的偏移量，它是以整个组件的中心为坐标原点，x、y 偏移量取值范围为 [-1,1]，如果 x 的偏移量大于 0
    //则表示向右偏移，小于 0 则向左偏移；如果 y 轴的偏移量大于 0 则向下偏移，小于 0 则向上偏移。
    alignment: AlignmentDirectional(0.8, -0.8),
    //子组件排列方向，可选值有：
    //TextDirection.ltr：从左往右排列
    //TextDirection.rtl：从右往左排列
    textDirection: TextDirection.ltr,
    //如何确定没有使用 Position 包裹的子组件的大小，可选值有：
    //StackFit.loose：子组件宽松取值，可以从 min 到 max
    //StackFit.expand：子组件取最大值
    //StackFit.passthrough：不改变子组件约束条件
    fit: StackFit.loose,
    //超出部分的处理方式，可选值有 Overflow.clip 和 Overflow.visible，不过我没有看到该属性的效果
    //overflow: Overflow.clip,
    )       
```
'''),
              WidgetMarkdown(data: '''

```
child: Stack(
    alignment: AlignmentDirectional(0.8, -0.8),
    textDirection: TextDirection.rtl,
    fit: StackFit.loose,
    children: <Widget>[
      CircleAvatar(
        backgroundImage:
            AssetImage("assets/images/material_design_4.jpg"),
        radius: 100,
      ),
      Text(
        "dddd",
        style: TextStyle(fontSize: 30, color: Color(0xFF000000)),
      ),
      Text(
        "aaa",
        style: TextStyle(fontSize: 30, color: Color(0xFF000000)),
      ),
      Positioned(
        left: 10,
        bottom: 10,
        width: 100,
        height: 100,
        child: Text(
          "鼬",
          style:
              TextStyle(fontSize: 40, color: Color(0xFF000000)),
        ),
      ),
    ],
  ),     
```
'''),
              Container(
                child: Stack(
                  alignment: AlignmentDirectional(0.8, -0.8),
                  textDirection: TextDirection.rtl,
                  fit: StackFit.loose,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/5415.jpg"),
                      radius: 100,
                    ),
                    Text(
                      "dddd",
                      style: TextStyle(fontSize: 30, color: Color(0xFF000000)),
                    ),
                    Text(
                      "aaa",
                      style: TextStyle(fontSize: 30, color: Color(0xFF000000)),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      width: 100,
                      height: 100,
                      child: Text(
                        "鼬",
                        style:
                            TextStyle(fontSize: 40, color: Color(0xFF000000)),
                      ),
                    ),
                  ],
                ),
              ),
              WidgetMarkdown(data: '''
##  层叠布局 Positioned
```
 const Positioned({
  Key key,
  this.left, 
  this.top,
  this.right,
  this.bottom,
  this.width,
  this.height,
  @required Widget child,
})      
```
'''),
            ],
          ),
        ),
      );
}
