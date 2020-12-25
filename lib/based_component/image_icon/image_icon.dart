import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'explain.dart';

class ImagesIcons extends StatefulWidget {
  const ImagesIcons({Key key}) :super(key: key);

  @override
  _ImagesIcons createState() => _ImagesIcons();
}

class _ImagesIcons extends State<ImagesIcons> {

  @override
  Widget build(BuildContext context) =>
      Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: IMAGEICON),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(05.0),
                      topRight: Radius.elliptical(05.0, 05.0),
                      bottomLeft: Radius.circular(05.0),
                      bottomRight: Radius.circular(05.0),
                    )),
                child: Column(children: <Widget>[
                  SizedBox(
                      height: 300.0,
                      child: Stack(children: <Widget>[
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/material_design_4.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          bottom: 16.0,
                          left: 0.0,
                          right: 0.0,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(00.0),
                                  alignment: Alignment.topLeft,
//卡片内文字居中
                                  color: Colors.blueGrey,
                                  width: double.infinity,
                                  child: ListTile(
                                      contentPadding: EdgeInsets.all(00.0),
//设置内容边距，默认是 16，但我们在这里设置为 0
                                      leading: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 32.0,
                                          child: Image.asset(
                                            'assets/images/dart-side.png',
                                            width: 50.0,
                                          )
// backgroundColor:Colors.blue,
                                      ),
                                      title: Text('images',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                          )),
                                      subtitle: Text('images - assets',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                          ))),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 5.0, left: 0.0),
                                    alignment: Alignment.topLeft, //卡片内文字居中
// color:Colors.blue,
                                    width: double.infinity,
                                    child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          Icon(Icons.stars,
                                              size: 50.0, color: Colors.orange),
                                          Icon(Icons.stars,
                                              size: 80.0, color: Colors.purple),
                                          Icon(Icons.stars,
                                              size: 50.0, color: Colors.orange),
                                        ]),
                                  ),
                                ),
                              ]),
                        ),
                      ])),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Text('SHARE'),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Text('EXPLORE'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),

      );
}

