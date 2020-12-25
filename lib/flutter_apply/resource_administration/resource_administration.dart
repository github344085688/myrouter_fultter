import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import './explain.dart';
class ResourceAdministration extends StatefulWidget{
  const ResourceAdministration ({Key key}):super(key:key);

  @override
  _ResourceAdministration createState()=> _ResourceAdministration();
}

class _ResourceAdministration extends State<ResourceAdministration>{

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Markdown(
          data: RESOURCEADMINISTRATION,
        )
  );

}