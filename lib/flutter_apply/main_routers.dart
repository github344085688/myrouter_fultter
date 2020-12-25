import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';

import 'package:my_router_flutter/flutter_apply/touter_admin/router_admin.dart';
import 'package:my_router_flutter/flutter_apply/touter_admin/explain.dart' show ROUTERADMIN;
import 'package:my_router_flutter/flutter_apply/resource_administration/resource_administration.dart';
import 'package:my_router_flutter/flutter_apply/resource_administration/explain.dart' show RESOURCEADMINISTRATION;
import 'package:my_router_flutter/flutter_apply/exception_handling/exception_handling.dart';
import 'package:my_router_flutter/flutter_apply/exception_handling/explain.dart' show EXCEPTIONHANDLING;



const flutterApply =<DefaultRoute>[
  DefaultRoute(
      groupName: "Flutter Apply",
      icon: Icon(Icons.extension),
      children: <DefaultRoute>[
        DefaultRoute(
            groupName: 'Router Admin',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: RouterAdmin(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/flutter_apply/touter_admin/router_admin.dart',
                  title: 'Router Admin ',
                  description: '路由管理',
                  explain: ROUTERADMIN,
                  arguments: {}),
            ]),
        DefaultRoute(
            groupName: 'Resource Administration',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: ResourceAdministration(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/flutter_apply/resource_administration/resource_administration.dart',
                  title: 'Resource Administration ',
                  description: '资源管理',
                  explain: RESOURCEADMINISTRATION,
                  arguments: {}),
            ]),
        DefaultRoute(
            groupName: 'Exception Handling',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: ExceptionHandling(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/flutter_apply/resource_administration/resource_administration.dart',
                  title: '异常捕获',
                  description: '异常捕获',
                  explain: EXCEPTIONHANDLING,
                  arguments: {}),
            ]),
      ]),
];
