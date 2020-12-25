import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
class WidgetMarkdown extends StatefulWidget {
  final String data;

  const WidgetMarkdown({Key key, @required this.data}):
        super(key: key);

  @override
  _WidgetMarkdown createState() => _WidgetMarkdown();
}

class _WidgetMarkdown extends State<WidgetMarkdown> {
  @override
  Widget build(BuildContext context) =>Container(
      width: double.infinity,
      child: MarkdownBody(selectable:true, shrinkWrap:false,fitContent:false,data: this.widget.data));
}
