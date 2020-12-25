import 'package:flutter/material.dart';
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';
import 'package:my_router_flutter/mainApp/agency_route.dart';


import 'package:my_router_flutter/based_component/flutter_widget/flutter_widget.dart';
import 'package:my_router_flutter/based_component/flutter_widget/explain.dart'show FLUTTERWIDGET;
import 'package:my_router_flutter/based_component/state_managements/state_managements.dart';
import 'package:my_router_flutter/based_component/state_managements/explain.dart'show STATEMANAGEMENTS;

import 'package:my_router_flutter/based_component/text_font_style/text_font_style.dart';
import 'package:my_router_flutter/based_component/text_font_style/explain.dart'show TEXTFONTSTYLE;

import 'package:my_router_flutter/based_component/button_style/button_style.dart';
import 'package:my_router_flutter/based_component/button_style/explain.dart'show BUTTONSTYLE;

import 'package:my_router_flutter/based_component/image_icon/image_icon.dart';
import 'package:my_router_flutter/based_component/image_icon/explain.dart'show IMAGEICON;

import 'package:my_router_flutter/based_component/radios_checkboxs/radios_checkboxs.dart';
import 'package:my_router_flutter/based_component/radios_checkboxs/explain.dart'show RADIOSCHECKBOXS,INPUTFIELDSANDFORMS;

import 'package:my_router_flutter/based_component/drop_domn_button/drop_domn_button.dart';

import 'package:my_router_flutter/based_component/radios_checkboxs/radios-data-table-example.dart';
import 'package:my_router_flutter/based_component/radios_checkboxs/widgets_stateful_widgets_ex.dart';
import 'package:my_router_flutter/based_component/radios_checkboxs/input_fields_and_forms.dart';
import 'package:my_router_flutter/based_component/radios_checkboxs/widgets_textformfield_ex.dart';

const basedComponent = <DefaultRoute>[
  DefaultRoute(
      groupName: "Widget",
      icon: Icon(Icons.extension),
      children: <DefaultRoute>[
        DefaultRoute(
            groupName: '简介及状态管理',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: FlutterWidget(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/based_component/flutter_widget/flutter_widget.dart',
                  title: 'Widget简介 ',
                  description: 'Widget与Element StatelessWidget Context StatefulWidget State State生命周期',
                  explain: FLUTTERWIDGET,
                  arguments: {}),
              AgencyRoute(
                  child: StateManagements(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/based_component/state_managements/state_managements.dart',
                  title: '状态管理 ',
                  description: 'Widget管理自身状态  父Widget管理子Widget的状态',
                  explain: STATEMANAGEMENTS,
                  arguments: {}),
            ]),
        DefaultRoute(
            groupName: '基础组件',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                  child: TextFontStyle(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: '',
                  title: '文本 字体 样式 ',
                  explain: TEXTFONTSTYLE,
                  arguments: {}),
              AgencyRoute(
                  child: ButtonStyles(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/based_component/button_style/button_style.dart',
                  title: '按钮 ',
                  description: 'RaisedButton FlatButton OutlineButton  IconButton',
                  explain: BUTTONSTYLE,
                  arguments: {}),
              AgencyRoute(
                  child: ImagesIcons(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/based_component/button_style/button_style.dart',
                  title: '图片及ICON',
                  description: '',
                  explain: IMAGEICON,
                  arguments: {}),
              AgencyRoute(
                  child: RadiosCheckboxs(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/based_component/radios_checkboxs/radios_checkboxs.dart',
                  title: '单选开关和复选框',
                  description: 'Radio Checkbox',
                  explain: RADIOSCHECKBOXS,
                  arguments: {}),
              AgencyRoute(
                  child: RadiosDataTableExample(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/based_component/radios_checkboxs/radios-data-table-example.dart',
                  title: '多选表格',
                  description: 'Radio Checkbox',
                  explain: RADIOSCHECKBOXS,
                  arguments: {}),
              AgencyRoute(
                  child: StatefulWidgetsExample(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/based_component/radios_checkboxs/widgets_stateful_widgets_ex.dart',
                  title: '多选，单选，加载条，距离拉申',
                  description: '多选，单选，加载条，距离拉申',
                  explain: RADIOSCHECKBOXS,
                  arguments: {}),
              AgencyRoute(
                  child: InputFieldsAndForms(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/based_component/radios_checkboxs/input_fields_and_forms.dart',
                  title: '输入框及表单',
                  description: 'TextField Form',
                  explain: INPUTFIELDSANDFORMS,
                  arguments: {}),
              AgencyRoute(
                  child: WidgetsTextFormFieldEx(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/based_component/radios_checkboxs/radios_checkboxs.dart',
                  title: 'Form TextField',
                  description: 'TextField Form',
                  explain: INPUTFIELDSANDFORMS,
                  arguments: {}),
              AgencyRoute(
                  child: DropDomnButton(),
                  icon: Icon(Icons.keyboard_arrow_right),
                  sourceFilePath: 'lib/based_component/drop_domn_button/drop_domn_button.dart',
                  title: '下拉选择框',
                  explain: INPUTFIELDSANDFORMS,
                  arguments: {}),
            ])
      ]),

];