import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            child: Text("跳转到搜索页面"),
            onPressed: () {
              //路由跳转
              Navigator.of(context).pushNamed('/search',arguments: {
                "id":12333333333333333
              });
            },
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary
        ),
      ],
    );
  }
}