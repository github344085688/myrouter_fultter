import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StackedPub extends StatefulWidget {
  const StackedPub({Key key}) : super(key: key);

  @override
  _StackedPub createState() => _StackedPub();
}

class _StackedPub extends State<StackedPub> {
  @override
  Widget build(BuildContext context) => ViewModelBuilder<HomeViewModel>.nonReactive(
    viewModelBuilder: () => HomeViewModel(),
    onModelReady: (model) => model.initialise(),
    builder: (context, model, _) => Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.updateTitle();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[TitleSection(), DescriptionSection()],
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


class TitleSection extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Row(
      children: <Widget>[
        Text(
          'Title',
          style: TextStyle(fontSize: 20),
        ),
        Container(
          child: Text(model.title),
        ),
      ],
    );
  }
}

class DescriptionSection extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
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