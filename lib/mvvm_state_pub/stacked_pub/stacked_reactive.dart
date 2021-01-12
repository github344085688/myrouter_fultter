import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StackedPub extends StatefulWidget {
  const StackedPub({Key key}) : super(key: key);

  @override
  _StackedPub createState() => _StackedPub();
}

class _StackedPub extends State<StackedPub> {
  @override
  Widget build(BuildContext context) => ViewModelBuilder<HomeViewModel>.reactive(
    viewModelBuilder: () => HomeViewModel(),
    onModelReady: (model) => model.initialise(),
    builder: (context, model, child) => Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.updateTitle();
        },
      ),
      body: Center(
        child: Text(model.title),
      ),
    ),
  );
}

// ViewModel
class HomeViewModel extends ChangeNotifier {
  String title = 'default';

  void initialise() {
    title = 'initialised';
    notifyListeners();
  }

  int counter = 0;
  void updateTitle() {
    counter++;
    title = '$counter';
    notifyListeners();
  }
}