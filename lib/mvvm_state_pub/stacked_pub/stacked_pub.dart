import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';

class StackedPub extends StatefulWidget {
  const StackedPub({Key key}) : super(key: key);

  @override
  _StackedPub createState() => _StackedPub();
}

class _StackedPub extends State<StackedPub> {
  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.initialise(),
        // disposeViewModel: false,
        // fireOnModelReadyOnce: true,
        builder: (context, model, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.updateTitle();
            },
          ),
          body: Provider.value(
            value: Human(name: 'Dane', surname: 'Mackier'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[FullNameWidget(), DuplicateNameWidget()],
            ),
          ),
        ),
      );
}

// Model
class Human {
  final String name;
  final String surname;

  Human({this.name, this.surname});
}

// ViewModel
class HomeViewModel extends ChangeNotifier {
  String title = 'default';
  String name = 'default';
  String surname = 'default';

  void initialise() {
    title = 'initialised';
    name = 'aaaa';
    surname = 'bbbbbb';
    notifyListeners();
  }

  int counter = 0;

  void updateTitle() {
    counter++;
    title = '$counter';
    name = 'ccccccc$counter';
    surname = 'fffffffff$counter';
    notifyListeners();
  }
}

class FullNameWidget extends ViewModelWidget<Human> {
  @override
  Widget build(BuildContext context, Human model) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(
            model.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Container(
          child: Text(
            model.surname,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ],
    );
  }
}

// consuming widget 2
class DuplicateNameWidget extends ViewModelWidget<Human> {
  @override
  Widget build(BuildContext context, Human model) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(model.name),
        ),
        SizedBox(
          width: 50,
        ),
        Container(
          child: Text(model.name),
        ),
      ],
    );
  }
}
