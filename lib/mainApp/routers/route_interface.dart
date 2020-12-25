import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';
class DefaultRoute {
  const DefaultRoute({
    @required this.groupName,
    @required this.icon,
    this.children,
    this.routes,
    String sourceFilePath,
    String title,
    this.child,
  });

  final String groupName;
  final Widget icon;
  final Widget child;
  final List<DefaultRoute> children;
  final List<AgencyRoute> routes;
}


class DefaultRouteGroup {
  const DefaultRouteGroup(
      {@required this.groupName, @required this.icon, @required this.routes});

  final String groupName;
  final Widget icon;
  final List<AgencyRoute> routes;
}
