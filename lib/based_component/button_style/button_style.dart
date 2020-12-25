import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'explain.dart';

class ButtonStyles extends StatefulWidget {
  const ButtonStyles({Key key}) : super(key: key);

  @override
  _ButtonStyles createState() => _ButtonStyles();
}

class _ButtonStyles extends State<ButtonStyles> {
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: BUTTONSTYLE),
              ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: double.infinity, //宽度尽可能大
                      minHeight: 50.0 //最小高度为50像素
                      ),
                  child: RaisedButton(
                    child: Text("RaisedButton"),
                    onPressed: () {},
                  )),
              SizedBox(
                height: 15.0,
              ),
              WidgetMarkdown(data: """
```
const FlatButton({
      @required this.onPressed, //按钮点击回调
      this.textColor, //按钮文字颜色
      this.disabledTextColor, //按钮禁用时的文字颜色
      this.color, //按钮背景颜色
      this.disabledColor,//按钮禁用时的背景颜色
      this.highlightColor, //按钮按下时的背景颜色
      this.splashColor, //点击时，水波动画中水波的颜色
      this.colorBrightness,//按钮主题，默认是浅色主题 
      this.padding, //按钮的填充
      this.shape, //外形
      @required this.child, //按钮的内容
})
```"""),
              SizedBox(
                height: 15.0,
              ),

              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: double.infinity, //宽度尽可能大
                    minHeight: 50.0 //最小高度为50像素
                    ),
                child: FlatButton(
                  child: Text("FlatButton"),
                  onPressed: () {},
                ),
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: double.infinity, //宽度尽可能大
                      minHeight: 50.0 //最小高度为50像素
                      ),
                  child: OutlineButton(
                    child: Text("OutlineButton"),
                    onPressed: () {},
                  )),
              ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: double.infinity, //宽度尽可能大
                      minHeight: 50.0 //最小高度为50像素
                      ),
                  child: IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {},
                  )),
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: double.infinity, //宽度尽可能大
                    minHeight: 50.0 //最小高度为50像素
                    ),
                child: Text(
                  "带图标的按钮RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数，通过它可以轻松创建带图标的按钮",
                  maxLines: 100,
                  style: TextStyle(
                    color: Color.fromRGBO(77, 99, 104, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 1.0,
              ),
              ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: double.infinity, minHeight: 50.0),
                child: Wrap(
                  spacing: 25.0, // 主轴(水平)方向间距
                  runSpacing: 2.0, // 纵轴（垂直）方向间距
                  alignment: WrapAlignment.start, //沿主轴方向居中
                  children: <Widget>[
                    RaisedButton.icon(
                        icon: Icon(Icons.send),
                        label: Text('带图标的按钮'),
                        onPressed: () {}),
                    FlatButton.icon(
                        icon: Icon(Icons.add, color: Colors.blue),
                        label: Text('带图标的按钮'),
                        onPressed: null),
                    FlatButton.icon(
                        icon: Icon(Icons.info, color: Colors.blue),
                        label: Text('带图标的按钮'),
                        onPressed: null),
                    IconButton(
                        color: Colors.blue,
                        focusColor: Colors.red,
                        hoverColor: Colors.red,
                        icon: Icon(Icons.info),
                        onPressed: () {}),
                    new Chip(
                      avatar: new CircleAvatar(
                          backgroundColor: Colors.blue, child: Text('H')),
                      label: new Text('Mulligan'),
                    ),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: double.infinity, //宽度尽可能大
                    minHeight: 50.0 //最小高度为50像素
                    ),
                child: FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[200],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.blue[800],
                  child: Text("Submit"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: double.infinity, //宽度尽可能大
                    minHeight: 50.0 //最小高度为50像素
                    ),
                child: RaisedButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[200],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.blue[800],
                  child: Text("Submit"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      );
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'explain.dart';
import 'package:markdown/markdown.dart' as md;

class ButtonStyles extends StatefulWidget {
  const ButtonStyles({Key key}) : super(key: key);

  @override
  _ButtonStyles createState() => _ButtonStyles();
}

class _ButtonStyles extends State<ButtonStyles> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body:
              */
/**    Markdown(
    data: BUTTONSTYLE,
    styleSheet: MarkdownStyleSheet(
    // 支持修改样式
    h1: TextStyle(fontSize: 20),
    p: TextStyle(fontSize: 20),
    ),
    // extensionSet: md.ExtensionSet(
    //     [md.gitHubFlavored.blockSyntaxes],
    //     [md.EmojiSyntax(), ...md.gitHubFlavored.inlineSyntaxes]),

    )

 */ /*

              Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

          ],
        ),
      ));
}



*/
