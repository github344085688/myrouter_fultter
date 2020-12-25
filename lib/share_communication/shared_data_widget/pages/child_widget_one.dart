import 'package:flutter/material.dart';
import './Inherited_context.dart';
class ChildWidgetOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);

    final inheritedTestModel = inheritedContext.inheritedTestModel;

    print('ChildWidgetOne 中count的值:=>  ${inheritedTestModel.count}');
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new RaisedButton(
          textColor: Colors.black,
          child: new Text('ChildWidgetOne=>+'),
          onPressed: inheritedContext.increment),
    );
  }
}
