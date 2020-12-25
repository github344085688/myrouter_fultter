import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';

class LayoutFlex extends StatefulWidget {
  const LayoutFlex({Key key}) : super(key: key);

  @override
  _LayoutFlex createState() => _LayoutFlex();
}

class _LayoutFlex extends State<LayoutFlex> {
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: '''
              '''),
              Container(
                width: double.infinity,
                height: 250.0,
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.start,
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 12.0,
                        height: 30.0,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: 100.0,
                  //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 30.0,
                          color: Colors.red,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 30.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
