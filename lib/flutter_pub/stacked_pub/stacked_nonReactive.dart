import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:my_router_flutter/flutter_pub/stacked_pub/home_model_view/model_view.dart';
import 'package:my_router_flutter/flutter_pub/stacked_pub/home_model_view/task_step_vm.dart';

class StackedNonReactive extends StatelessWidget {
  const StackedNonReactive({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<PickTaskStepVM>.nonReactive(
          viewModelBuilder: () => PickTaskStepVM(context),
          onModelReady: (model) => model.initSteps(),
          builder: (BuildContext context, PickTaskStepVM model, Widget child) =>
              ModelView<PickTaskStepVM>(
                children: <Widget>[TitleSection(), DescriptionSection()],
                taskSummaryBuilder: (context, generalTask) {
                  dynamic task = 'generalTask';
                  return  Text(
                    'Description=>from parent function',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  );

                 // print('-----------------=======================');
                },
              ));
}

class TitleSection extends ViewModelWidget<PickTaskStepVM> {
  @override
  Widget build(BuildContext context, PickTaskStepVM model) {
    return Row(
      children: <Widget>[
        Text(
          'Title',
          style: TextStyle(fontSize: 20),
        ),
        Container(
          child: Text(model.title),
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('点我'),
          onPressed: () {
            model.updateTitle();
          },
        )
      ],
    );
  }
}

class DescriptionSection extends ViewModelWidget<PickTaskStepVM> {
  @override
  Widget build(BuildContext context, PickTaskStepVM model) {
    return Row(
      children: <Widget>[
        Text(
          'Description',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        Container(
          child: Text(model.title),
        ),
      ],
    );
  }
}
