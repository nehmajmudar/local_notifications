import 'package:flutter/material.dart';
import 'package:local_notifications/res/app_colors.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller=AnimationController(vsync: this,duration: Duration(seconds: 2)).forward(from: 0.0) as AnimationController;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorGrey,
        centerTitle: true,
        title: Text("Rotation animation"),
      ),
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0,end: 5.0).animate(controller),
          child: Container(
            height: 300,
            width: 100,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
