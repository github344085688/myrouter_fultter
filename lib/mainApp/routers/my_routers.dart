/**
 * main #主要的
 * */
import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/homePage/home_page.dart';
import 'package:my_router_flutter/mainApp/constants.dart';
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';
import 'package:my_router_flutter/mainApp/routers/page_router_config.dart';


const homeRoute = AgencyRoute(
  child: MyHomePage(),
  sourceFilePath: 'lib/routes/home.dart',
  title: APP_NAME,
  routeName: Navigator.defaultRouteName,
);

const kMyAppRoutesBasic = <DefaultRouteGroup>[
  DefaultRouteGroup(
    groupName: 'Widgets',
    icon: Icon(Icons.extension),
    routes: <AgencyRoute>[],
  ),
];

const kMyAppRoutesAdvanced = <DefaultRouteGroup>[
  DefaultRouteGroup(
    groupName: 'Animation (advanced)',
    icon: Icon(Icons.movie_filter),
    routes: <AgencyRoute>[],
  ),
];

final kAllRouteGroups = <DefaultRouteGroup>[
  ...kMyAppRoutesBasic,
  ...kMyAppRoutesAdvanced,
];

_entryItem(DefaultRoute routes) {
  if (routes.children == null) return routes.routes;
  return routes.children.map(_entryItem);
}

expandList(list) => list.expand((element) => element).toList();

final rootAll = MyDefaultRoutes.map(_entryItem).toList();
final rootAllR = rootAll.expand((element) => element).toList();
final rootAllRoutes = rootAllR.expand((element) => element).toList();

/**
    final rootAllRoutes = <AgencyRoute>[
    ...kAllRouteGroups.expand((group) =>group.routes)
    ];
 */
/**
    final rootAllRoutes = <AgencyRoute>[
    ...kAllRouteGroups.expand((group) {
    print('------------------');
    print(group.routes.toString());
    print('------------------');
    return group.routes;
    }),
    ];*/
//
//final kRouteNameToRoute = <String, AgencyRoute>{
//  for (final route in rootAllRoutes) route.routeName: route
//};
//
//final kRouteNameToRouteGroup = <String, DefaultRouteGroup>{
//  for (final group in kAllRouteGroups)
//    for (final route in group.routes) route.routeName: group
//};
