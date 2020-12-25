import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';


import 'package:my_router_flutter/share_communication/communication/communication.dart';
import 'package:my_router_flutter/share_communication/communication/explain.dart' show PARENTCHILDCOMMUNICATION;
import 'package:my_router_flutter/share_communication/shared_data_widget/shared_data_widget.dart';
import 'package:my_router_flutter/share_communication/shared_data_widget/explain.dart' show SHAREDDATAWIDGET;


const shareCommunication = <DefaultRoute>[
  DefaultRoute(
      groupName: "share",
      icon: Icon(Icons.extension),
      children: <DefaultRoute>[
        DefaultRoute(
            groupName: '路由流程,state生命周期',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: Communication(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/lifecycle/lifecycle.dart',
                  title: '路由流程,state生命周期',
                  description: '路由流程,state生命周期',
                  explain: PARENTCHILDCOMMUNICATION,
                  arguments: {}),
            ]),
        DefaultRoute(
            groupName: '父子组件通信',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: Communication(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/share_communication/communication/communication.dart',
                  title: '父子组件通信',
                  explain:PARENTCHILDCOMMUNICATION),
            ]),
        DefaultRoute(
            groupName: 'Widget数据共享之InheritedWidget',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: SharedDataWidget(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/share_communication/shared_data_widget/shared_data_widget.dart',
                  title: '父子组件通信',
                  explain:SHAREDDATAWIDGET),
            ]),

      ]),

];