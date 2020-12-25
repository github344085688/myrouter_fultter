import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'explain.dart';

class ScrollbarWidget extends StatefulWidget {
  const ScrollbarWidget({Key key}) : super(key: key);

  @override
  _ScrollbarWidget createState() => _ScrollbarWidget();
}

class _ScrollbarWidget extends State<ScrollbarWidget> {
  bool isToTop = false;

  //滚动控制器
  ScrollController _controller;

  void _onPressed() {
    //回到ListView顶部
    _controller.animateTo(0,
        duration: Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > 1000) {
        setState(() {
          isToTop = true;
        });
      } else if (_controller.offset <= 500) {
        setState(() {
          isToTop = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("CustomView AppBar Title")),
        body: CustomScrollView(
          controller: _controller,
          slivers: <Widget>[
            SliverAppBar(
              title: Text("视差滚动效果",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold)),
              floating: true,
              flexibleSpace: Image.asset(
                'assets/images/material_design_4.jpg',
                fit: BoxFit.cover,
              ),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item $index')),
                childCount: 100,
              ),
            )
          ],
        ),
        floatingActionButton: isToTop
            ? FloatingActionButton(
                onPressed: () => _onPressed(), child: Icon(Icons.arrow_upward))
            : null,
      ),
    );
  }
}
