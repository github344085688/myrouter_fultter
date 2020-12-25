import 'package:flutter/material.dart';
abstract class TaskStepVM extends ChangeNotifier{
  closeTask();
  updateTitle();
}

class PickTaskStepVM extends TaskStepVM{
  final BuildContext context;
  String title = 'default1';
  void initialise() {
    title = 'initialised';
    notifyListeners();
  }

  int counter = 0;

  @override
  void updateTitle() {
    counter++;
    title = '$counter';
    notifyListeners();
  }

  PickTaskStepVM(this.context);

  initSteps() {
    title = 'initialised';
    notifyListeners();
  }

  @override
  closeTask() async {
    counter++;
    title = '$counter';
    notifyListeners();
  }

  forceCloseTask() async {

  }
}