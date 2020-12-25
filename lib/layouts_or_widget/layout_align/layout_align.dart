import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LayoutAlign extends StatefulWidget {
  const LayoutAlign({Key key}) : super(key: key);

  @override
  _LayoutAlign createState() => _LayoutAlign();
}

class _LayoutAlign extends State<LayoutAlign> {
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: """
```
Align({
  Key key,
  this.alignment = Alignment.center,
  this.widthFactor,
  this.heightFactor,
  Widget child,
})
```
              """),
              Container(
                height: 240.0,
                width: 240.0,
                color: Colors.blue[50],
                child: Align(
                  widthFactor: 8,
                  heightFactor: 8,
                  alignment: Alignment(1, 0.0),
                  child: SvgPicture.asset(
                    "assets/images/logo1.svg",
                    color: Color(0xff388DF3),
                  ),

                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SvgPicture.asset(
                "assets/images/logo1.svg",
                width:240.0,
                height:240.0,
                color: Color(0xff388DF3),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: Align(
                  alignment: FractionalOffset(0.2, 0.6),
                  child: SvgPicture.asset(
                    "assets/images/logo1.svg",
                    color: Color(0xff388DF3),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
