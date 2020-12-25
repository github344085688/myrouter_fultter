import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';

class LayoutPadding extends StatefulWidget {
  const LayoutPadding({Key key}) : super(key: key);

  @override
  _LayoutPadding createState() => _LayoutPadding();
}

class _LayoutPadding extends State<LayoutPadding> {
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: '''
```
      Padding({
      ...
      EdgeInsetsGeometry padding,
      Widget child,
      })
```

## EdgeInsets
  - fromLTRB(left, top, right, bottom)：分别指定四个方向的填充。
  - all(value) : 所有方向均使用相同数值的填充。
  - only({left, top, right ,bottom })：可以设置具体某个方向的填充(可以同时指定多个方向)。
  - symmetric({ vertical, horizontal })：用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right。
              '''),
              SizedBox(height: 16.0),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 250.0,
                ),
                child: Container(
                    color:Colors.blue,
                    child:  Padding(
                    //上下左右各添加16像素补白
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      //显式指定对齐方式为左对齐，排除对齐干扰
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          //左边添加8像素补白
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Hello world"),
                        ),
                        Padding(
                          //上下各添加8像素补白
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("I am Jack"),
                        ),
                        Padding(
                          // 分别指定四个方向的补白
                          padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
                          child: Text("Your friend"),
                        )
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
}
