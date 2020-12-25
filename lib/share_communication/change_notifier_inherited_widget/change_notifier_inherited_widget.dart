import 'package:flutter/material.dart';
import 'task_step_vm.dart';
class ChangeNotifierInheritedWidget <T extends TaskStepVM> extends StatefulWidget{
  const ChangeNotifierInheritedWidget({Key key}) : super(key: key);
  @override
  _ChangeNotifierInheritedWidget createState()=>_ChangeNotifierInheritedWidget();


}
class _ChangeNotifierInheritedWidget extends State<ChangeNotifierInheritedWidget>{
  @override
     Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Task ')),
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

            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10,);
              },
            ),

            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}