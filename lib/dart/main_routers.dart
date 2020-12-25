import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';

import 'package:my_router_flutter/dart/class/super.dart';
import 'package:my_router_flutter/dart/sugar_syntactic/sugar_syntactic.dart';
import 'package:my_router_flutter/dart/class/explain.dart' show DARTSUPER;


const dartGrammar =<DefaultRoute>[
  DefaultRoute(
      groupName: "Dart",
      icon: Icon(Icons.extension),
      children: <DefaultRoute>[
        DefaultRoute(
            groupName: 'Class Super',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: DartSuper(
                      explain: 'explainaaaaaaaaaaaaaaaaaa',
                      arguments: {}),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/dart/class/super.dart',
                  title: 'Class Super ',
                  description: 'Super 继承-调用父类fun 传值父,获取父的值',
                  explain: DARTSUPER,
                  arguments: {}),
            ]),
        DefaultRoute(
            groupName: 'dart 语法 ',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: SugarSyntactic(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/dart/sugar_syntactic/sugar_syntactic.dart',
                  title: 'dart 语法',
                  description: '语法',
                  explain: DARTSUPER,
                  arguments: {}),
            ])
      ]),
];
/**

    */