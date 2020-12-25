import 'package:flutter/material.dart';
abstract class TaskStepVM extends ChangeNotifier{
  closeTask();
}

class ReceiveTaskStepVM extends TaskStepVM{
  final BuildContext context;


  ReceiveTaskStepVM(this.context);

  initSteps() {

  }

  @override
  closeTask() async {
    try {

    }catch (e){

    }
  }

}