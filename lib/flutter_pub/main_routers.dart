import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';

import 'package:my_router_flutter/flutter_pub/markdown/markdown_example.dart';
import 'package:my_router_flutter/flutter_pub/provider/example/provider_example.dart';
import 'package:my_router_flutter/flutter_pub/provider/example/explain.dart' show PROVIDEREXAMPLE;
import 'package:my_router_flutter/flutter_pub/shard_preferences/example/shard_preferences.dart';
import 'package:my_router_flutter/flutter_pub/stacked_pub/stacked_pub.dart';
import 'package:my_router_flutter/flutter_pub/stacked_pub/stacked_nonReactive.dart';
import 'package:my_router_flutter/flutter_pub/stacked_pub/explain.dart' show STACKEDPUBMOUDELS;

import 'package:my_router_flutter/flutter_pub/flutter_staggered_grid_view_pub/flutter_staggered_grid_view_pub.dart';

const flutterPub = <DefaultRoute>[
  DefaultRoute(
      groupName: "Flutter Pub",
      icon: Icon(Icons.extension),
      children: <DefaultRoute>[
        DefaultRoute(
            groupName: 'Provider',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                child: ProviderExample(),
                icon: Icon(Icons.keyboard_arrow_right),
                sourceFilePath:
                'lib/flutter_pub/provider/example/provider_example.dart',
                title: 'Provider Example',
                description: '状态管理',
                explain: PROVIDEREXAMPLE,)
            ]),
        DefaultRoute(
            groupName: 'Markdown',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: MarkdownExample(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath:
                  'lib/flutter_pub/markdown/markdown_example.dart',
                  title: 'flutter_markdown pub',
                  description: 'text 渲染 博客样式')
            ]),
        DefaultRoute(
            groupName: 'Shared Preferences',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: Preferences(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath:
                  'lib/flutter_pub/shard_preferences/example/shard_preferences.dart',
                  title: 'Shared Preferences',
                  description: '轻量级存储类'),
              AgencyRoute(
                  child: StackedPub(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath:
                  'lib/flutter_pub/stacked_pub/stacked_pub.dart',
                  title: 'MVVM 简化应用程序开发的常见功能',
                  description: 'MVVM 简化应用程序开发的常见功能'),
              AgencyRoute(
                  child: StackedNonReactive(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath:
                  'lib/flutter_pub/stacked_pub/stacked_nonReactive.dart',
                  title: 'MVVM ViewModel View stacked',
                  description: 'MVVM 父子组件方法调用，级方法传递 stacked ',
                  explain:STACKEDPUBMOUDELS)
            ]),
        DefaultRoute(
            groupName: 'flutter Staggered Grid View',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: FlutterStaggeredGridViewPub(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath:
                  'lib/flutter_pub/flutter_staggered_grid_view_pub/flutter_staggered_grid_view_pub.dart',
                  title: 'Shared Preferences',
                  description: '实现不同高度的滚动瀑布流'),


            ])
      ]),

];