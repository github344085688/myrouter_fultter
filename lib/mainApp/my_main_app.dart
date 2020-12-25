import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/routers/root_app_routing_table.dart'
    show rootAppRoutingTable;
import 'package:provider/provider.dart';
import 'package:my_router_flutter/flutter_pub/provider/counter.dart';
import 'package:my_router_flutter/mainApp/routers/my_routers.dart'
    show homeRoute;
class MyMainApp extends StatelessWidget {
  const MyMainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider.value(value: Counter(1))
        ],
        child: _MyMainApp()
    );
   /** return ChangeNotifierProvider<Counter>.value(
        value: Counter(1),
        child: _MyMainApp()
    );*/
  }
}
/**
class _MyMainApp extends StatelessWidget {
  const _MyMainApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Main App Flutter',
      routes: rootAppRoutingTable,
    );
  }
}

 */
class _MyMainApp extends StatelessWidget {
  const _MyMainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Main App Flutter',
      home: homeRoute.child,
      // Navigator.defaultRouteName: (context) => homeRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}

//Navigator.pushNamed 调用（在router跳转时候调用发生。）
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  //outer跳转时候匹配Widget,
  final Function pageContentBuilder = rootAppRoutingTable[name];
  print('========${settings.arguments}');
  print('--------${settings.name}');
  print('+++++++++${rootAppRoutingTable[name]}');
  if (pageContentBuilder != null) {
    //在router跳转时候处理arguments
    if (settings.arguments != null) {
      final Route route =   MaterialPageRoute(
        builder: (context) {
          //将RouteSettings中的arguments参数取出来，通过构造函数传入
          return pageContentBuilder(context, arguments: settings.arguments);
        },
        settings: settings,
      );
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};