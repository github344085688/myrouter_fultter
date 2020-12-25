import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';


import 'package:my_router_flutter/navigator/navigator_expert/nav_expert.dart';
import 'package:my_router_flutter/navigator/navigator_expert/explain.dart' show NAVIGATOREXPERT;
import 'package:my_router_flutter/navigator/based_on_using/navigator_based.dart';
import 'package:my_router_flutter/navigator/based_on_using/explain.dart' show BASEDONUSING;
import 'package:my_router_flutter/navigator/routers/nav_routes_ex.dart';

const navigator = <DefaultRoute>[
  DefaultRoute(
      groupName: "Navigator",
      icon: Icon(Icons.extension),
      children: <DefaultRoute>[
        DefaultRoute(
            groupName: 'Navigator 基础使用',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: NavigatorBased(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/navigator/based_on_using/navigator_based.dart',
                  title: 'Nav 基础使用',
                  explain:BASEDONUSING),
            ]),
        DefaultRoute(
            groupName: 'Navigator 高级用法',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: NavigatorAdvanced(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/navigator/navigator_expert/nav_expert.dart',
                  title: 'Nav 高级用法',
                  explain:NAVIGATOREXPERT),
            ]),
        DefaultRoute(
            groupName: 'Navigator 其他',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                child: RoutesExample(),
                icon: Icon(Icons.keyboard_arrow_right),
                sourceFilePath: 'lib/navigator/navigator_expert/nav_expert.dart',
                title: 'Nav 其他',
              ),
            ])
      ]),

];