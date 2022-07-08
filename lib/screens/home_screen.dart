import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        title: Text("Screen utils pulgin"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(300),
              color: Colors.blue,
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(300),
              color: Colors.red,
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(300),
              color: Colors.green,
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(300),
              color: Colors.brown,
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(300),
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
