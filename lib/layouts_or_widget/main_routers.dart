import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';

import 'package:my_router_flutter/layouts_or_widget/layout_row_column/layout_row_column.dart';
import 'package:my_router_flutter/layouts_or_widget/layout_row_column/layout_flex.dart';
import 'package:my_router_flutter/layouts_or_widget/layout_frap_flow/layout_frap_flow.dart';
import 'package:my_router_flutter/layouts_or_widget/layout_align/layout_align.dart';
import 'package:my_router_flutter/layouts_or_widget/layout_padding/layout_padding.dart';
import 'package:my_router_flutter/layouts_or_widget/layout_constrained_box/layout_constrained_box.dart';
import 'package:my_router_flutter/layouts_or_widget/layout_decorated_box/layout_decorated_box.dart';
import 'package:my_router_flutter/layouts_or_widget/layout-stack-positioned/layout-stack-positioned.dart';
import 'package:my_router_flutter/layouts_or_widget/scrollbar_widget/scrollbar_widget.dart';
import 'package:my_router_flutter/layouts_or_widget/container/container.dart';
import 'package:my_router_flutter/layouts_or_widget/transform_widget/transform_widget.dart';
import 'package:my_router_flutter/layouts_or_widget/container_widget/container_widget.dart';
import 'package:my_router_flutter/layouts_or_widget/scaffold_tabBar_navigationBar/scaffold_tabBar_navigationBar.dart';


import 'package:my_router_flutter/layouts_or_widget/container/explain.dart' show LAYOUTSCONTAINER;


const layoutRouter = <DefaultRoute>[
  DefaultRoute(
      groupName: "layouts",
      icon: Icon(Icons.extension),
      children: <DefaultRoute>[
        DefaultRoute(
            groupName: '布局类组件',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: LayoutRowColumn(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/layout_row_column/layout_row_column.dart',
                  title: '线性布局（Row和Column)',
                  description: ' ',
                  explain:LAYOUTSCONTAINER,
                  arguments:{}),
              AgencyRoute(
                  child: LayoutFlex(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/layout_row_column/layout_flex.dart',
                  title: '弹性布局（Flex）',
                  description: ' ',
                  explain:LAYOUTSCONTAINER,
                  arguments:{}),
              AgencyRoute(
                  child: LayoutFrapFlow(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/layout_frap_flow/layout_frap_flow.dart',
                  title: '流式布局(Wrap,Flow)',
                  description: '通过Wrap和Flow来支持流式布局',
                  explain:LAYOUTSCONTAINER,
                  arguments:{}),
              AgencyRoute(
                  child: LayoutStackPositioned(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/layout-stack-positioned/layout-stack-positioned.dart',
                  title: ' 层叠布局 Stack、Positioned',
                  description: '通过Wrap和Flow来支持流式布局',
                  explain:'',
                  arguments:{}),
              AgencyRoute(
                  child: LayoutAlign(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/layout_align/layout_align.dart',
                  title: '对齐与相对定位（Align）',
                  description: '调整一个子元素在父元素中的位置',
                  explain:'',
                  arguments:{}),
            ]),
        DefaultRoute(
            groupName: '容器类Widget',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: LayoutPadding(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/layout_padding/layout_padding.dart',
                  title: 'padding',
                  description: ' ',
                  explain:'',
                  arguments:{}),
              AgencyRoute(
                  child: LayoutConstrainedBox(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/layout_constrained_box/layout_constrained_box.dart',
                  title: '尺寸限制类容器 ConstrainedBox',
                  description: ' ',
                  explain:LAYOUTSCONTAINER,
                  arguments:{}),
              AgencyRoute(
                  child: LayoutDecoratedBox(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/layout_decorated_box/layout_decorated_box.dart',
                  title: '装饰容器DecoratedBox',
                  description: '绘制一些装饰（Decoration），如背景、边框、渐变等。DecoratedBox定义如下',
                  explain:LAYOUTSCONTAINER,
                  arguments:{}),
              AgencyRoute(
                  child: TransformWidget(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/layout_decorated_box/layout_decorated_box.dart',
                  title: '变换（Transform）',
                  description: '绘制一些装饰（Decoration），如背景、边框、渐变等。DecoratedBox定义如下',
                  explain:LAYOUTSCONTAINER,
                  arguments:{}),
              AgencyRoute(
                  child: ContainerWidget(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/layout_decorated_box/layout_decorated_box.dart',
                  title: 'Container（装饰、变换、限制的场景）',
                  description: '多功能容器，通过一个Container组件可以实现同时需要装饰、变换、限制的场景。',
                  explain:LAYOUTSCONTAINER,
                  arguments:{}),
              AgencyRoute(
                  child: ScaffoldTabBarNavigationBar(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/scaffold_tabBar_navigationBar/scaffold_tabBar_navigationBar.dart',
                  title: 'Scaffold、TabBar、bottomNavigationBar',
                  description: 'Scaffold、TabBar、bottomNavigationBar',
                  explain:LAYOUTSCONTAINER,
                  arguments:{}),
            ]),
        DefaultRoute(
            groupName: '可滚动组件简介',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: ScrollbarWidget(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/container/container.dart',
                  title: 'Scrollable 可滚动组件简介',
                  description: ' ',
                  explain:LAYOUTSCONTAINER,
                  arguments:{}),
            ]),
        DefaultRoute(
            groupName: 'container',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: LayoutContainer(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/layouts_or_widget/container/container.dart',
                  title: 'container',
                  description: '是绘制painting,定位positioning以及尺寸sizing的widget',
                  explain:LAYOUTSCONTAINER,
                  arguments:{}),
            ])
      ]),

];