import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class LocalNotificationsViewMoudle extends ChangeNotifier {
  BuildContext _context;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  dynamic android = new AndroidInitializationSettings('@mipmap/ic_launcher_logo');
  dynamic iOS = new IOSInitializationSettings();

  LocalNotificationsViewMoudle(BuildContext context) {
    _context = context;
  }
  void initState() {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    final initSetttings = new InitializationSettings(android:android, iOS:iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings, onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
   showDialog(
      context: _context,
      builder: (_) => new AlertDialog(
        title: new Text('Notification'),
        content: new Text('$payload'),
      ),
    );
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
      'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
      priority: Priority.high,
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android:android, iOS:iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'New Video is out', 'Flutter Local Notification', platform,
        payload: 'Nitish Kumar Singh is part time Youtuber');

  }

}