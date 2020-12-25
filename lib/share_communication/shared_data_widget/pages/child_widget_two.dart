import 'package:flutter/material.dart';
import './Inherited_context.dart';
class ChildWidgetTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final inheritedContext = InheritedContext.of(context);

    final inheritedTestModel = inheritedContext.inheritedTestModel;

    print('ChildWidgetTwo 中count的值=>  ${inheritedTestModel.count}');

    return  new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child:  new Text('ChildWidgetTwo=>当前count:${inheritedTestModel.count}',style: new TextStyle(fontSize: 20.0),),
    );
  }
}
