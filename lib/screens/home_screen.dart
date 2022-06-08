import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notifications/main.dart';
import 'package:local_notifications/screens/destination_screen.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isSelected=false;
  bool isSimpleSelected=false;
  bool isPeriodSelected=false;
  bool isInsistent=false;
  bool didProgress=false;

  @override
  void initState() {
    tz.initializeTimeZones();
    super.initState();
    init();
  }

  Future<void> init()async{
    var androidSettings=const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initSettings=InitializationSettings(android: androidSettings);
    await flutterLocalNotificationsPlugin.initialize(initSettings,onSelectNotification: onClickNotification);
  }

  Future<void> onClickNotification(String? payload)async{
    await Navigator.of(context).push(MaterialPageRoute(builder: (context){return const DestinationScreen();}));
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
        0,
        "Simple notification",
        "This is a simple notification",
        const NotificationDetails(
            android: AndroidNotificationDetails("simple_channel", "Simple notification",
                channelDescription: "channel_description",
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  Future<void> scheduledNotification()async{
    await flutterLocalNotificationsPlugin.zonedSchedule(
        129,
        "Scheduled notification",
        "This was a scheduled notification",
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
        const NotificationDetails(
          android: AndroidNotificationDetails('channel', 'channel_schedule',
            channelDescription: 'This is a scheduled notification',
            icon: '@mipmap/ic_launcher'
          ),
        ), uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  Future<void> showPeriodicNotification()async{
    await flutterLocalNotificationsPlugin.periodicallyShow(234, "periodic", "Periodic notification", RepeatInterval.everyMinute,
      const NotificationDetails(
        android: AndroidNotificationDetails("periodic channel", "period",channelDescription: "channel_descri",icon: '@mipmap/ic_launcher')
      )
    );
  }

  Future<void> showProgressNotification() async {
    const int maxProgress = 6;
    for (int i = 0; i <= maxProgress; i++) {
      await Future<void>.delayed(const Duration(seconds: 2), () async {
        final AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('channel_id', 'Channel Name', channelDescription: 'progress_channel',
            channelShowBadge: false,
            importance: Importance.max,
            priority: Priority.high,
            onlyAlertOnce: true,
            showProgress: true,
            maxProgress: maxProgress,
            progress: i);
        final NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
        await flutterLocalNotificationsPlugin.show(0, 'Flutter Local Notification', 'Flutter Progress Notification',
            notificationDetails);
      });
    }
  }



  Future<void> showInsistentNotification()async{
    int insistentFlag=5;
    await flutterLocalNotificationsPlugin.show(156, "insistent", "Insistent notification",
      NotificationDetails(
        android: AndroidNotificationDetails("insistent channel", "Insistence",channelDescription: "channel_insistence",
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'ticker',
            additionalFlags: Int32List.fromList(<int>[insistentFlag]),
            icon: '@mipmap/ic_launcher')
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Press for demo of notification"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    isSelected=!isSelected;
                  });
                  print("SImple button pressed");
                  showNotification();
                  print("SImple button pressed later");
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/3,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 80),
                  child: const Text("Simple",style: TextStyle(fontSize: 15)),
                  decoration: isSelected?const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ):const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    isSimpleSelected=!isSimpleSelected;
                  });
                  print("Scheduled notification button pressed");
                  scheduledNotification();
                  print("Scheduled notification button pressed later");
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/3,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 40),
                  child: const Text("Scheduled",style: TextStyle(fontSize: 15)),
                  decoration: isSimpleSelected?const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ):const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    isPeriodSelected=!isPeriodSelected;
                  });
                  print("Period notification button pressed");
                  showPeriodicNotification();
                  print("Period notification button pressed later");
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/3,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 40),
                  child: const Text("Periodic",style: TextStyle(fontSize: 15)),
                  decoration: isPeriodSelected?const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ):const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    isInsistent=!isInsistent;
                  });
                  print("Period notification button pressed");
                  showInsistentNotification();
                  print("Period notification button pressed later");
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/3,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 40),
                  child: const Text("Insistent",style: TextStyle(fontSize: 15)),
                  decoration: isInsistent?const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ):const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    didProgress=!didProgress;
                  });
                  print("Progress notification button pressed");
                  showProgressNotification();
                  print("Progress notification button pressed later");
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/3,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 40),
                  child: const Text("Progress",style: TextStyle(fontSize: 15)),
                  decoration: didProgress?const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ):const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
