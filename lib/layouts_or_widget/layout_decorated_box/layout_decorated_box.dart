import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';

class LayoutDecoratedBox extends StatefulWidget {
  const LayoutDecoratedBox({Key key}) : super(key: key);

  @override
  _LayoutDecoratedBox createState() => _LayoutDecoratedBox();
}

class _LayoutDecoratedBox extends State<LayoutDecoratedBox> {
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: """
## __DecoratedBox可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等__
``` 
const DecoratedBox({
  Decoration decoration,//代表将要绘制的装饰，它的类型为Decoration。Decoration是一个抽象类，它定义了一个接口 createBoxPainter()，子类的主要职责是需要通过实现它来创建一个画笔，该画笔用于绘制装饰。
  DecorationPosition position = DecorationPosition.background,//此属性决定在哪里绘制Decoration，它接收DecorationPosition的枚举类型，该枚举类有两个值：
  Widget child
})
```
## __BoxDecoration__
__它是一个Decoration的子类，实现了常用的装饰元素的绘制。__
```
BoxDecoration({
  Color color, //颜色
  DecorationImage image,//图片
  BoxBorder border, //边框
  BorderRadiusGeometry borderRadius, //圆角
  List<BoxShadow> boxShadow, //阴影,可以指定多个
  Gradient gradient, //渐变
  BlendMode backgroundBlendMode, //背景混合模式
  BoxShape shape = BoxShape.rectangle, //形状
})
```
下面我们实现一个带阴影的背景色渐变的按钮：
 ```
 DecoratedBox(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
      borderRadius: BorderRadius.circular(3.0), //3像素圆角
      boxShadow: [ //阴影
        BoxShadow(
            color:Colors.black54,
            offset: Offset(2.0,2.0),
            blurRadius: 4.0
        )
      ]
    ),
  child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
    child: Text("Login", style: TextStyle(color: Colors.white),),
  )
)
```
              """),
              DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                      borderRadius: BorderRadius.circular(3.0), //3像素圆角
                      boxShadow: [ //阴影
                        BoxShadow(
                            color:Colors.black54,
                            offset: Offset(2.0,2.0),
                            blurRadius: 4.0
                        )
                      ]
                  ),
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                    child: Text("Login", style: TextStyle(color: Colors.white),),
                  )
              ),
              SizedBox(height: 25.0),
              WidgetMarkdown(data: """
通过BoxDecoration我们实现了一个渐变按钮的外观，但此示例还不是一个标准的按钮，因为它还不能响应点击事件，我们将在后面“自定义组件”一章中实现一个完整功能的GradientButton。另外，上面的例子中使用了LinearGradient类，它用于定义线性渐变的类，Flutter中还提供了其它渐变配置类，如RadialGradient、SweepGradient
```
              """),
            ],
          ),
        ),
      );
}
