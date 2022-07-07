import 'package:flutter/material.dart';
import 'package:local_notifications/res/app_colors.dart';
import 'package:local_notifications/screens/next_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Color _newColor=Colors.yellow;
  // double _newValue=0;
  int opaqueValue=10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween Animation"),
        centerTitle: true,
        backgroundColor: AppColors.colorGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              child: TweenAnimationBuilder(
                tween: IntTween(begin: 1,end: 10),
                duration: Duration(seconds: 10),
                builder: (BuildContext context,int i,Widget? child){
                  return Center(
                    child: Text("13 x ${i} = ${13*i}",style: TextStyle(fontSize: 30,color: Colors.black),),
                  );
                }
              ),
            ),
          ),
          // Center(
          //   child: TweenAnimationBuilder(
          //     tween: IntTween(begin: 1,end: 10),
          //     duration: const Duration(seconds: 10),
          //     builder: (BuildContext context,int i, Widget? Child){
          //       return Text("The multiplier: ${i} ");
          //     }
          //   ),
          // )
          // Slider.adaptive(
          //   value: _newValue,
          //   onChanged: (double value){
          //     setState(() {
          //       _newValue=value;
          //       _newColor=Color.lerp(Colors.blue, Colors.green, value)!;
          //     });
          //   }
          // )
        ],
      ),
    );
  }
}
