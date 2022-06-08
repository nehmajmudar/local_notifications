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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local notifications"),
      ),
      body: Center(
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
                margin: const EdgeInsets.only(top: 200),
                child: const Text("Simple",style: TextStyle(fontSize: 50)),
                decoration: isSelected?const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ):const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20))
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
                margin: const EdgeInsets.only(top: 40),
                child: const Text("Scheduled",style: TextStyle(fontSize: 50)),
                decoration: isSimpleSelected?const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ):const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
            ),
          ],
        ),
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       GestureDetector(
      //         onTap: (){
      //           showSimpleNotification();
      //         },
      //         child: Container(
      //           margin: const EdgeInsets.only(bottom: 40),
      //           color: Colors.orangeAccent,
      //           child: const Text('Simple notification'),
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: (){
      //           scheduleNotification();
      //         },
      //         child: Container(
      //           margin: const EdgeInsets.only(bottom: 40),
      //           color: Colors.orangeAccent,
      //           child: const Text('Scheduled notification'),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
