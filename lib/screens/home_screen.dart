import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<double> animationWifi;
  late AnimationController controllerWifi;
  late Animation<double> animationCell;
  late AnimationController controllerCell;
  late Animation<double> animationDisconnect;
  late AnimationController controllerDisconnect;
  bool wifiSelected = false;
  bool cellSelected = false;
  bool disconnected = false;
  bool isVisible = false;

  // bool isVisible=false;

  late StreamSubscription subscription;
  // ConnectivityResult connectionResult = ConnectivityResult.none;

  void connectivityStatus(ConnectivityResult result) {
    if(result==ConnectivityResult.wifi){
      controllerWifi.forward();
      controllerCell.reverse();
      controllerDisconnect.reverse();
    }
    else if(result == ConnectivityResult.mobile){
      controllerWifi.reverse();
      controllerCell.forward();
      controllerDisconnect.reverse();
    }
    else if(result == ConnectivityResult.none || isVisible!=true){
      isVisible=true;
      controllerWifi.reverse();
      controllerCell.reverse();
      controllerDisconnect.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    subscription =
        Connectivity().onConnectivityChanged.listen(connectivityStatus);

    controllerWifi = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animationWifi = Tween<double>(begin: 50, end: 70).animate(controllerWifi);
    controllerWifi.addListener(() {
      setState(() {});
    });

    controllerCell = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animationCell = Tween<double>(begin: 50, end: 70).animate(controllerCell);
    controllerCell.addListener(() {
      setState(() {});
    });

    controllerDisconnect = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animationDisconnect =
        Tween<double>(begin: 50, end: 70).animate(controllerDisconnect);
    controllerDisconnect.addListener(() {
      setState(() {});
    });

  }


  @override
  void dispose() {
    controllerWifi.dispose();
    controllerCell.dispose();
    controllerDisconnect.dispose();
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // print(connectionResult);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Task"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedBuilder(
                animation: animationWifi,
                builder: (context, child) {
                  return Container(
                    height: animationWifi.value,
                    width: animationWifi.value,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(animationWifi.value))),
                    child: const Icon(
                      Icons.wifi,
                      size: 40,
                    ),
                  );
                }),
            AnimatedBuilder(
              animation: animationCell,
              builder: (context,child){
                return Container(
                  height: animationCell.value,
                  width: animationCell.value,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.signal_cellular_alt,size: 40,),
                );
              },
            ),
            Visibility(
              visible: isVisible,
              child: AnimatedBuilder(
                animation: animationDisconnect,
                builder: (context,child){
                  return Container(
                    height: animationDisconnect.value,
                    width: animationDisconnect.value,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: const Icon(Icons.no_cell,size: 40,),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
