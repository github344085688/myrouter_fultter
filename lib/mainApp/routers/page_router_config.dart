
import 'package:my_router_flutter/mainApp/routers/route_interface.dart';

import 'package:my_router_flutter/dart/main_routers.dart';
import 'package:my_router_flutter/based_component/main_routers.dart';
import 'package:my_router_flutter/layouts_or_widget/main_routers.dart';
import 'package:my_router_flutter/flutter_apply/main_routers.dart';
import 'package:my_router_flutter/flutter_widget/main_routers.dart';
import 'package:my_router_flutter/flutter_pub/main_routers.dart';
import 'package:my_router_flutter/http/main_routers.dart';
import 'package:my_router_flutter/navigator/main_routers.dart';
import 'package:my_router_flutter/share_communication/main_routers.dart';
import 'package:my_router_flutter/lifecycle/main_routers.dart';
import 'package:my_router_flutter/mvvm_state_pub/main_routers.dart';

const MyDefaultRoutes = <DefaultRoute>[
  ...dartGrammar,
  ...basedComponent,
  ...layoutRouter,
  ...flutterApply,
  ...flutterWidget,
  ...flutterPub,
  ...flutterHttp,
  ...navigator,
  ...shareCommunication,
  ...lifecycle,
  ...MvvmStatePub
];
