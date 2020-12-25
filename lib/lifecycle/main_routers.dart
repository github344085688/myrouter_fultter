import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';

import 'package:my_router_flutter/lifecycle/overall_situation/overall_situation.dart';

const lifecycle = <DefaultRoute>[
  DefaultRoute(
      groupName: "life cycle ",
      icon: Icon(Icons.extension),
      children: <DefaultRoute>[
        DefaultRoute(
            groupName: '生命周期',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: OverallSituation(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/lifecycle/overall_situation/overall_situation.dart',
                  title: '生命周期',
                  description: ' ',
                  explain:'',
                  arguments:{}),

            ]),
      ]),

];