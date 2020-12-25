import 'package:flutter/material.dart';

class HomePageDrawer extends StatefulWidget {
  const HomePageDrawer({Key key}) : super(key: key);

  @override
  _HomePageDrawer createState() => _HomePageDrawer();
}

class _HomePageDrawer extends State<HomePageDrawer> {
  @override
  Widget build(BuildContext context) => Drawer(
        child: MediaQuery.removePadding(
          context: context,
          //移除抽屉菜单顶部默认留白
          removeTop: true,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                height: double.infinity,
                color: Color(0xff123748),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 40.0,
                right: 40.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffd55858),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 120.0,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    // color: Color(0xffD64724),
                    image: new DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: new ExactAssetImage(
                        'assets/images/sccnn.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  // child: Container(
                  //   color: Colors.red,
                  //   height: double.infinity,
                  // ),
                ),
              ),
              Positioned(
                top: 50.0,
                left: 50.0,
                width: 200.0,
                height: 200.0,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(200.0)),
                    color: Color(0xffb23023),
                  ),
                  child: Image.asset("assets/images/login01.png", width: 170.0),
                ),
              ),
              Positioned(
                top: 180.0,
                left: -5.0,
                child:Image.asset("assets/images/he01.png", width: 170.0)
              ),
              Positioned(
                  top: 380.0,
                  right: -25.0,
                  child:Image.asset("assets/images/he02.png", width: 170.0)
              ),
              Positioned(
                  top: 295.0,
                  left: 30.0,
                  width: 250.0,
                  height: 300.0,
                  child:ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.add,color: Colors.white),
                          title:  Text('Add account',style:TextStyle(color: Colors.white,fontSize: 18.0)),
                        ),
                        ListTile(
                          leading: Icon(Icons.settings,color: Colors.white),
                          title: Text('Manage accounts',style:TextStyle(color: Colors.white,fontSize: 18.0)),
                        ),
                      ],
                    ),


              ),
            ], //指定未定位或部分定位widget的对齐方式
          ),
        ),
      );
}
