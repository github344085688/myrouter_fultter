import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';
import 'package:my_router_flutter/mainApp/routers/my_routers.dart'
    show homeRoute, rootAllRoutes;

// This app's root-level routing table.
//使用pushNamed跳转肯定要在routes表中注册该页面，所以把ExtractArgumentsScreen注册进去
/**
 * MaterialApp(
    routes: {
    ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
    },
    );
 */
final rootAppRoutingTable = <String, WidgetBuilder>{
  Navigator.defaultRouteName: (context) => homeRoute,
  for (AgencyRoute route in rootAllRoutes) route.routeName: (content, {dynamic arguments}) =>route.namedContr(arguments: arguments)
};
