import 'package:flutter/material.dart';
import 'package:local_notifications/res/app_colors.dart';
import 'package:local_notifications/screens/next_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorGrey,
        title: const Text("Hero"),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NextScreen()));
          },
          child: Hero(
            tag: 'button',
            child: Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              child: const Text("Click for hero effect"),
              decoration: const BoxDecoration(
                color: Colors.blueAccent
              ),
            ),
          ),
        )
      ),
    );
  }
}
