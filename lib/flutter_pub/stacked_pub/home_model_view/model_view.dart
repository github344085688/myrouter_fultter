import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:my_router_flutter/flutter_pub/stacked_pub/home_model_view/task_step_vm.dart';

class ModelView<T extends TaskStepVM> extends ViewModelWidget<T> {
  final List<Widget> children;
  final Function(BuildContext context, dynamic task) taskSummaryBuilder;

  const ModelView({Key key, this.children, this.taskSummaryBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context, T model) {
    dynamic task = 'currentTask';
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.updateTitle();
        },
      ),
      body: ListView(padding: EdgeInsets.all(00.0), children: <Widget>[
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(05.0),
              // topRight: Radius.elliptical(05.0, 05.0),
                bottomLeft: Radius.circular(05.0),
                bottomRight: Radius.circular(05.0),
            ),
          ),
          child: Column(
           children: <Widget>[
            SizedBox(
                height: 200.0,
                child: Stack(children: <Widget>[
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/material_design_4.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    bottom: 16.0,
                    left: 16.0,
                    right: 16.0,
                    child: Column(
                        children:children
                    ),
                  ),
                ])),
             ButtonBar(
               alignment: MainAxisAlignment.end,
               children: <Widget>[
                 FlatButton(
                   child: Text('SHARE'),
                   onPressed: () {},
                 ),
                 FlatButton(
                   child: Text('EXPLORE'),
                   onPressed: () {},
                 ),
               ],
             ),
          ]
              // children: children,
              ),
        ),


        Divider(),
        Column(
          children: <Widget>[
            taskSummaryBuilder(context, task),
            Center(
              child: IconButton(
                iconSize: 32.0,
                icon: Icon(Icons.call),
                tooltip: 'Place a phone call',
                // onPressed: _showSnack,
              ),
            )
          ],
        ),
      ]),
    );
  }
}
/*

crossAxisAlignment: CrossAxisAlignment.start,

SizedBox(height: 10,),
taskSummaryBuilder(context, task),
SizedBox(height: 20,),*/
