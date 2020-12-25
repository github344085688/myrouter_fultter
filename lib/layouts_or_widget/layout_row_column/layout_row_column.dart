import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'explain.dart';

class LayoutRowColumn extends StatefulWidget {
  const LayoutRowColumn({Key key}) : super(key: key);

  @override
  _LayoutRowColumn createState() => _LayoutRowColumn();
}

class _LayoutRowColumn extends State<LayoutRowColumn> {
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: '''
```
Row({
  CrossAxisAlignment.start：子组件在 Row 中顶部对齐
  CrossAxisAlignment.end：子组件在 Row 中底部对齐
  CrossAxisAlignment.center：子组件在 Row 中居中对齐
  CrossAxisAlignment.stretch：拉伸填充满父布局
  CrossAxisAlignment.baseline：在 Row 组件中会报错
  crossAxisAlignment: CrossAxisAlignment.start,
  MainAxisAlignment.start：靠左排列
  MainAxisAlignment.end：靠右排列
  MainAxisAlignment.center：居中排列
  MainAxisAlignment.spaceAround：每个子组件左右间隔相等，也就是 margin 相等
  MainAxisAlignment.spaceBetween：两端对齐，也就是第一个子组件靠左，最后一个子组件靠右，剩余组件在中间平均分散排列
  MainAxisAlignment.spaceEvenly：每个子组件平均分散排列，也就是宽度相等
  MainAxisSize.max：相当于 Android 的 match_parent
  MainAxisSize.min：相当于 Android 的 wrap_content
  mainAxisSize: MainAxisSize.max,
  textBaseline: TextBaseline.alphabetic,
  TextDirection.ltr：从左往右开始排列
  TextDirection.rtl：从右往左开始排列
  确定如何在垂直方向摆放子组件，以及如何解释 start 和 end，指定 height 可以看到效果，可选值有：
  VerticalDirection.up：Row 从下至上开始摆放子组件，此时我们看到的底部其实是顶部
  VerticalDirection.down：Row 从上至下开始摆放子组件，此时我们看到的顶部就是顶部
})
```            
              '''),
              Container(
                width: double.infinity,
                height: 100.0,
                child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                          child: Container(
                            color: Color(0xFFFF0000),
                            child: Text(
                              "Text1",
                              style: TextStyle(fontSize: 30.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                            color: Color(0xFFFFFF00),
                            child: Text(
                              "Text2",
                              style: TextStyle(fontSize: 30.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                            color: Color(0xFF00FF00),
                            child: Text(
                              "Text3",
                              style: TextStyle(fontSize: 30.0),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            color: Color(0xFF0000FF),
                            child: Text(
                              "Text4",
                              style: TextStyle(fontSize: 30.0),
                            ),
                          )),
                    ]
                ),
              ),
              WidgetMarkdown(data: '''
```
Column({            
  CrossAxisAlignment.start：子组件在 Row 中顶部对齐
  CrossAxisAlignment.end：子组件在 Row 中底部对齐
  CrossAxisAlignment.center：子组件在 Row 中居中对齐
  CrossAxisAlignment.stretch：拉伸填充满父布局
  CrossAxisAlignment.baseline：在 Row 组件中会报错            
  MainAxisAlignment.start：靠左排列
  MainAxisAlignment.end：靠右排列
  MainAxisAlignment.center：居中排列
  MainAxisAlignment.spaceAround：每个子组件左右间隔相等，也就是 margin 相等
  MainAxisAlignment.spaceBetween：两端对齐，也就是第一个子组件靠左，最后一个子组件靠右，剩余组件在中间平均分散排列
  MainAxisAlignment.spaceEvenly：每个子组件平均分散排列，也就是宽度相等
  Main 轴大小，可选值有：
  MainAxisSize.max：相当于 Android 的 match_parent
  MainAxisSize.min：相当于 Android 的 wrap_content
  mainAxisSize: MainAxisSize.max,不太理解
  textBaseline: TextBaseline.alphabetic,
  子组件排列顺序，可选值有：
  TextDirection.ltr：从左往右开始排列
  TextDirection.rtl：从右往左开始排列
  确定如何在垂直方向摆放子组件，以及如何解释 start 和 end，指定 height 可以看到效果，可选值有：
  VerticalDirection.up：Row 从下至上开始摆放子组件，此时我们看到的底部其实是顶部
  VerticalDirection.down：Row 从上至下开始摆放子组件，此时我们看到的顶部就是顶部
})
```              
              '''),
              Container(
                width: double.infinity,
                height: 400.0,
                child:  Column(
                  verticalDirection: VerticalDirection.down,
                  textDirection: TextDirection.ltr,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          width: double.infinity,
                          color: Color(0xFFFF0000),
                          child: Text(
                            "Text1",
                            style: TextStyle(fontSize: 30.0),
                          ),
                        )),
                    Expanded(
                        child: Container(
                          width: double.infinity,
                          color: Color(0xFFFFFF00),
                          child: Text(
                            "Text2",
                            style: TextStyle(fontSize: 30.0),
                          ),
                        )),
                    Expanded(
                        child: Container(
                          width: double.infinity,
                          color: Color(0xFF00FF00),
                          child: Text(
                            "Text3",
                            style: TextStyle(fontSize: 30.0),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          color: Color(0xFF0000FF),
                          child: Text(
                            "Text4",
                            style: TextStyle(fontSize: 30.0),
                          ),
                        )),
                  ],
                ),
              ),

            ],
          ),
        ),
      );
}

