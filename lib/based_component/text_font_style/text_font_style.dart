import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'explain.dart';

class TextFontStyle extends StatefulWidget {
  const TextFontStyle({Key key}) : super(key: key);

  @override
  _TextFontStyle createState() => _TextFontStyle();
}

class _TextFontStyle extends State<TextFontStyle> {
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: TEXTFONTSTYLE),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hello world",
                textAlign: TextAlign.left,
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hello world! I'm Jack. ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(
                "Hello world",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: new Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(
                "Hello world",
                textScaleFactor: 1.5,
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(color: Colors.blue),
                  // recognizer: _tapRecognizer
                ),
              ]))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Container(
                width: 150,
                color: Colors.red,
                child: DefaultTextStyle(
                  style: TextStyle(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  child: Text('老孟Flutter，专注分享Flutter相关技术'),
                ),
              ),
            ],
          ),
            ]
        ),
      )
      );
}
