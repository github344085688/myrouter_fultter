import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';

import 'package:my_router_flutter/http/dio/example/http_example.dart';
import 'package:my_router_flutter/http/http_modules/http_page_test_page.dart';
const flutterHttp = <DefaultRoute>[
  DefaultRoute(
      groupName: "Http",
      icon: Icon(Icons.extension),
      children: <DefaultRoute>[
        DefaultRoute(
            groupName: 'Dio Example ',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: HttpExample(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/http/dio/example/http_example.dart',
                  title: 'Http Example'),
              AgencyRoute(
                  child: HttpPageTestPage(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/http/http_modules/example/http_example.dart',
                  title: 'Http Page Test Page'),
            ])
      ]),

];