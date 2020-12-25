import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StackedPub extends StatelessWidget {
  const StackedPub({Key key}) :super(key: key);
  @override
  Widget build(BuildContext context) {
    // Using the reactive constructor gives you the traditional viewmodel
    // binding which will excute the builder again when notifyListeners is called.
    return ViewModelBuilder<HomeViewModel>.reactive(
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
/**
class StackedPub<T extends TaskStepVM> extends ViewModelWidget<T> {
// class TaskStepWidget<T extends TaskStepVM> extends ViewModelWidget<T>
  const StackedPub({Key key}) :super(key: key);

  _onStepClick(BuildContext context, String menu) {
    // Steps step = menu.extras['step'];
    // Provider.of<TaskOperModel>(context, listen: false).setCurrentStep(step);
    // locator<NavigationService>().pushPage(menu.attachPage);
  }

  @override
  Widget build(BuildContext context, T model) {
    return Scaffold(
      appBar: AppBar(title: Text('sss''} Task (sss''})'),),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('task.id', style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
              fontSize: 20,
            ),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 20,),

            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onStepClick(context, 'steps[index]'),
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.directions_bus,
                            color: Theme.of(context).primaryColor,
                            size: 40,
                          ),
                          SizedBox(width: 15,),
                          Text('steps[index].name', style: TextStyle(
                            fontSize: 16,
                          ),),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10,);
              },

            ),

            SizedBox(height: 20,),
            ExpandedWrap(
              child: RaisedButton(
                onPressed: () => model.closeTask(),
                child: Text('Close Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
    */