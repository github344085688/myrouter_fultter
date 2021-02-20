import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:my_router_flutter/mainApp/utilities/local_notifications_view_moudle.dart';


class LocalNotifications extends StatefulWidget {
  const LocalNotifications({Key key}) : super(key: key);

  @override
  _LocalNotifications createState() => _LocalNotifications();
}

class _LocalNotifications extends State<LocalNotifications> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocalNotificationsViewMoudle>.nonReactive(
        viewModelBuilder: () => LocalNotificationsViewMoudle(context),
        onModelReady: (model) => model.initState(),
        builder: (context, viewModel, _) =>
            Scaffold(
              appBar: new AppBar(
                title: new Text('Flutter Local Notification'),
              ),
              body: new Center(
                child: new RaisedButton(
                  onPressed: viewModel.showNotification,
                  child: new Text(
                    'Demo',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline,
                  ),
                ),
              ),
            )
    );
  }
}