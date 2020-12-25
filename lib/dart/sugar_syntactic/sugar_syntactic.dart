import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'explain.dart';

class SugarSyntactic extends StatefulWidget {
  const SugarSyntactic({Key key}) : super(key: key);

  @override
  _SugarSyntactic createState() => _SugarSyntactic();
}

class _SugarSyntactic extends State<SugarSyntactic> {
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: SUGARSYNTACTIC),
            ],
          ),
        ),
      );
}
