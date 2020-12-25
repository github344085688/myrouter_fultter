import 'package:flutter/material.dart';
import 'pages/Tabs.dart';
import 'pages/Form.dart';
import 'pages/Search.dart'; //配置路由

final routes = {
  '/': (context) => Tabs(),
  '/form': (context) => FormPage(),
  '/search': (context, {arguments}) => SearchPage(arguments: arguments),
};

class NavigatorBased extends StatefulWidget {
  const NavigatorBased({Key key}) : super(key: key);

  @override
  _NavigatorBased createState() => _NavigatorBased();
}

class _NavigatorBased extends State<NavigatorBased> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        // routes: routes,
        // home:Tabs(),
        //   initialRoute: '/',     //初始化的时候加载的路由
        onGenerateRoute: onGenerateRoute);
  }
}

//Navigator.pushNamed 调用（在router跳转时候调用发生。）
// ignore: top_level_function_literal_block
// ignore: missing_return
// ignore: top_level_function_literal_block
// ignore: missing_return
// ignore: top_level_function_literal_block
// ignore: missing_return
// ignore: top_level_function_literal_block
var onGenerateRoute = (dynamic settings) {
  final String name = settings.name;
  //outer跳转时候匹配Widget,
  final Function pageContentBuilder = routes[name];
  print('ddddddddddd${routes[name]}');
  if (pageContentBuilder != null) {
    //在router跳转时候处理arguments
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
