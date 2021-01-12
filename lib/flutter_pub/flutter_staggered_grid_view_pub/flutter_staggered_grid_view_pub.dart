import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:convert';
class FlutterStaggeredGridViewPub extends StatefulWidget {
  const FlutterStaggeredGridViewPub({Key key}) : super(key: key);

  @override
  _FlutterStaggeredGridViewPub createState() => _FlutterStaggeredGridViewPub();
}

class _FlutterStaggeredGridViewPub extends State<FlutterStaggeredGridViewPub> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    print('初始化进入');

    _scrollController.addListener(() {
      print('我监听到了');
    });
  }
  /*Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/student.json');
  }*/
  /*Future loadStudent() async {
    String jsonString = await _loadAStudentAsset();
    final jsonResponse = json.decode(jsonString);
    Student student = new Student.fromJson(jsonResponse);
    print(student.studentScores);
  }*/




  @override
  Widget build(BuildContext context) =>FutureBuilder(
      future:DefaultAssetBundle
          .of(context)
          .loadString('assets/json/creads.json'),
      builder:(context, snapshot) {
      var new_data = json.decode(snapshot.data.toString());
      return Scaffold(
          body: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(Duration(seconds: 5));
                  },
                  child: StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      crossAxisCount: 3,//设置有几列
                      crossAxisSpacing: 6.0,//横轴间距
                      mainAxisSpacing: 6.0,//纵轴间距
                      itemCount: new_data.length,
                      itemBuilder: (context, index) {
                        return Container(
                            color: Colors.green,
                            child: Image.asset(new_data[index]['img'],
                              width: double.infinity,
                            ),);
                      },
                      staggeredTileBuilder: (index) =>
                          StaggeredTile.fit(1)),//StaggeredTile.count：固定纵轴和主轴上的数量
                ),
              ),
            ],
          ));
     }
  );



    /*  ;*/
}
