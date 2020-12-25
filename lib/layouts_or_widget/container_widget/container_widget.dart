import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({Key key}) : super(key: key);

  @override
  _ContainerWidget createState() => _ContainerWidget();
}

class _ContainerWidget extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: """
```
 Container({
  this.alignment,
  this.padding, //容器内补白，属于decoration的装饰范围
  Color color, // 背景色
  Decoration decoration, // 背景装饰
  Decoration foregroundDecoration, //前景装饰
  double width,//容器的宽度
  double height, //容器的高度
  BoxConstraints constraints, //容器大小的限制条件
  this.margin,//容器外补白，不属于decoration的装饰范围
  this.transform, //变换
  this.child,
})  
```
              """),
              Container(
                margin: EdgeInsets.only(top: 50.0, left: 120.0),
                //容器外填充
                constraints:
                    BoxConstraints.tightFor(width: 200.0, height: 150.0),
                //卡片大小
                decoration: BoxDecoration(
                    //背景装饰
                    gradient: RadialGradient(
                        //背景径向渐变
                        colors: [Colors.red, Colors.orange],
                        center: Alignment.topLeft,
                        radius: .98),
                    boxShadow: [
                      //卡片阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ]),
                transform: Matrix4.rotationZ(.2),
                //卡片倾斜变换
                alignment: Alignment.center,
                //卡片内文字居中
                child: Text(
                  //卡片文字
                  "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.white),
                  color: Colors.grey,
                  borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                  image: new DecorationImage(
                    image: new ExactAssetImage(
                      'assets/images/16.jpg',
                    ),
                    fit: BoxFit.fitWidth,
                    // centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                  ),
                  boxShadow: [
                    //卡片阴影
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 4.0)
                  ],
                ),
                padding: const EdgeInsets.all(0.0),
                height: 400.0,
                width: double.infinity,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: double.infinity,
                  child: new Image.asset(
                    'assets/images/sdfsd80.jpg',
                    fit: BoxFit.fitHeight,
                    // height:double.infinity,
                    alignment: Alignment.bottomRight,
                    // centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                  ),
                ),
              ),
              SizedBox(
                height: 400.0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.white),
                  color: Colors.grey,
                  // borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(05.0),
                    topRight: Radius.circular(05.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  image: new DecorationImage(
                    image: new ExactAssetImage(
                      'assets/images/16.jpg',
                    ),
                    fit: BoxFit.fitWidth,
                    // centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                  ),
                  boxShadow: [
                    //卡片阴影
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 4.0,
                        spreadRadius:1.0),
                  ],
                ),
                padding: const EdgeInsets.all(0.0),
                height: 450.0,
                width: double.infinity,
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      top: -2.0,
                      left: -1.0,
                      right: -1.0,
                      bottom:0.0,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          // border: Border.all(width: 2.0, color: Colors.white),
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(05.0),
                            topRight: Radius.elliptical(05.0, 05.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          image: new DecorationImage(
                            image: new ExactAssetImage(
                              'assets/images/3096.jpg',
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                          // boxShadow: [
                          //   //卡片阴影
                          //   BoxShadow(
                          //       color: Colors.deepOrangeAccent,
                          //       offset: Offset(0.0, 5.0),
                          //       blurRadius: 2.0,
                          //       spreadRadius:-1.0),
                          // ],
                        ),
                       /* child: new Image.asset(
                          'assets/images/jh.jpg',
                          fit: BoxFit.fitHeight,
                          // height:double.infinity,
                          alignment: Alignment.bottomRight,
                          // centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                        ),*/
                      ),
                    ),
                    Positioned(
                      left: -2.0,
                      right: -2.0,
                      bottom:-1.0,
                      height: 80.0,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.white),
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        padding:EdgeInsets.all(10.0),
                        child:Column(
                            children:<Widget>[
                              Flex(
                                  direction: Axis.horizontal,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Text("3096.jpg",
                                          textAlign: TextAlign.left,
                                          style: new TextStyle(
                                              color:Colors.blue,
                                              decorationStyle: TextDecorationStyle.solid,
                                              fontSize: 20
                                          ),),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text("100%",
                                          textAlign: TextAlign.right,
                                          style: new TextStyle(
                                              color:Colors.blue,
                                              decorationStyle: TextDecorationStyle.solid,
                                              fontSize: 20
                                          ),),
                                    ),
                                  ],
                              ),
                              Container(
                                width: double.infinity,
                                child: Text("TextDecorationStyle",
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                      color:Colors.black38,
                                      decorationStyle: TextDecorationStyle.solid,
                                      fontSize: 16
                                  ),),
                              ),
                            ],
                        ),
                        // child:Text("3096.jpg",
                        //   textAlign: TextAlign.left,
                        //   style: new TextStyle(
                        //       color:Colors.blue,
                        //       decorationStyle: TextDecorationStyle.solid,
                        //       fontSize: 20
                        //   ),),
                        /* child: new Image.asset(
                          'assets/images/jh.jpg',
                          fit: BoxFit.fitHeight,
                          // height:double.infinity,
                          alignment: Alignment.bottomRight,
                          // centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                        ),*/
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300.0,
              ),
            ],
          ),
        ),
      );
}
