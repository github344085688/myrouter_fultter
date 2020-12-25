import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'explain.dart';

class DartSuper extends StatefulWidget {
  final String _explain;
  final dynamic arguments;
  const DartSuper({Key key, String explain, dynamic arguments})
      : _explain = explain,
        arguments = arguments ,
        super(key: key);

  DartSuper namedConter(
      { Key key,
        String explain,
        dynamic arguments}) {
    return DartSuper(
      explain: explain ?? this._explain,
      arguments: arguments ?? this.arguments,
    );
  }

  @override
  _DartSuper createState() => _DartSuper();
}

class _DartSuper extends State<DartSuper> {
  @override
  Widget build(BuildContext context) => Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              WidgetMarkdown(data: DARTSUPER),
            ],
          ),
        ),
      );
}

/**


    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';

    class DartSuper extends StatefulWidget {
    final String _explain;
    final dynamic arguments;
    const DartSuper(
    {Key key,
    String explain,
    this.arguments})
    : _explain = explain,
    super(key: key);

    DartSuper namedConter(
    { Key key,
    String explain,
    dynamic arguments}) {
    return DartSuper(
    explain: explain ?? this._explain,
    arguments: arguments ?? this.arguments,
    );
    }
    // DartSuper merge({Key key,String explain, dynamic arguments}) {
    //   return DartSuper(
    //       explain: explain ?? this._explain,
    //       arguments: arguments ?? this.arguments);
    // }

    @override
    _DartSuper createState() => _DartSuper();
    }

    class _DartSuper extends State<DartSuper> {
    @override
    void initState() {
    init();
    super.initState();
    }

    void init() async {
    print(this.widget._explain);
    print('this.widget.DartSuper ${this.widget.arguments}');
    }

    //  override
    @override
    Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(child: Text('this.widget._explain')
    /*   Markdown(
    selectable: true,
    data: _markdownData,
    ),*/
    ),
    );
    }
    }
 */
