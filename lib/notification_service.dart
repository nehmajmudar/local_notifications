
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{
  // static final NotificationService _notificationService=NotificationService._internal();
  // factory NotificationService(){
  //   return _notificationService;
  // }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

  // NotificationService._internal();

  Future<void> init() async{
    const AndroidInitializationSettings initializationSettingsAndroid=AndroidInitializationSettings('ic_launcher');

    const InitializationSettings initializationSettings=InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> simpleNotification(int id,String title,String body)async{
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'simple_channel',
          'simple_channel_name',
          channelDescription: 'channel_descr',
          playSound: true,
          icon: 'ic_launcher',
          importance: Importance.max,
          priority: Priority.high
        )
      )
    );
  }
}