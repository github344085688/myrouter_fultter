import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';

import 'package:my_router_flutter/flutter_widget/app_bar/app_bar_ex.dart';
import 'package:my_router_flutter/flutter_widget/app_bar/documents.dart' show APPBAR_DOC;
import 'package:my_router_flutter/flutter_widget/lists/tile_example.dart';
import 'package:my_router_flutter/flutter_widget/lists/listview_example.dart';

const flutterWidget = <DefaultRoute>[
  DefaultRoute(
      groupName: "Flutter Widget",
      icon: Icon(Icons.extension),
      children: <DefaultRoute>[
        DefaultRoute(
            groupName: 'App Bar',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: AppBarExample(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/flutter_widget/app_bar/app_bar_ex.dart',
                  title: 'App Bar ',
                  description: 'Note',
                  explain:APPBAR_DOC,
                  arguments:{}),
            ]),
        DefaultRoute(
            groupName: 'List',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: ExpansionTileExample(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath:
                  'lib/flutter_widget/lists/tile_example.dart',
                  title: 'Expansion Tile',
                  arguments:{}),
              AgencyRoute(
                  child: ListViewBuilderExample(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath:
                  'lib/http/http_modules/http_page_test_page.dart',
                  title: 'List View Builder Tile',
                  arguments:{})
            ]),
      ]),

];