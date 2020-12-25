import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import './my_drawer.dart';
class ScaffoldTabBarNavigationBar extends StatefulWidget{
  const ScaffoldTabBarNavigationBar({Key key}):super(key:key);
  @override
  _ScaffoldTabBarNavigationBar createState() => _ScaffoldTabBarNavigationBar();
}
class _ScaffoldTabBarNavigationBar extends State<ScaffoldTabBarNavigationBar>{
  int _selectedIndex = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar( //导航栏
        title: Text("App Name"),
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed:() => _scaffoldKey.currentState.openDrawer()),
        ],
      ),
      drawer: new MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton( //悬浮按钮
          child: Icon(Icons.add),
          onPressed:_onAdd
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onAdd(){
    _scaffoldKey.currentState.openDrawer();
    // Scaffold.of(context).openDrawer();
  }
}