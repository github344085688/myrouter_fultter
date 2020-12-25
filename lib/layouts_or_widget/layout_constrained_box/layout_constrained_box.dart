import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';

class LayoutConstrainedBox extends StatefulWidget {
  const LayoutConstrainedBox({Key key}) : super(key: key);

  @override
  _LayoutConstrainedBox createState() => _LayoutConstrainedBox();
}

class _LayoutConstrainedBox extends State<LayoutConstrainedBox> {
  Widget redBox=DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: """
```       
ConstrainedBox({
  Key key,
  @required this.constraints,
  Widget child,
})
```
  - ### BoxConstraints//BoxConstraints用于设置限制条件，它的定义如下：
```
 const BoxConstraints({
  this.minWidth = 0.0, //最小宽度
  this.maxWidth = double.infinity, //最大宽度
  this.minHeight = 0.0, //最小高度
  this.maxHeight = double.infinity //最大高度
})
```
  - ### SizedBox用于给子元素指定固定的宽高，如：
```
SizedBox(
  width: 80.0,
  height: 80.0,
  child: redBox
)
```
              """),
               ConstrainedBox(
                 constraints: BoxConstraints(
                    minWidth: double.infinity,
                    minHeight: 500.0,
                 ),
                 child: Image.asset("assets/images/5415.jpg"),
               ),
              SizedBox(width: 80.0, height: 80.0,child: redBox),

            ],
          ),
        ),
      );
}
