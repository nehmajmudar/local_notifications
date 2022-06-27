import 'package:flutter/material.dart';
import 'package:local_notifications/screens/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local notifications',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() => runApp(const LogoApp());
//
// // #docregion LogoWidget
// class LogoWidget extends StatelessWidget {
//   const LogoWidget({Key? key}) : super(key: key);
//
//   // Leave out the height and width so it fills the animating parent
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: const FlutterLogo(),
//     );
//   }
// }
// // #enddocregion LogoWidget
//
// // #docregion GrowTransition
// class GrowTransition extends StatelessWidget {
//   const GrowTransition({Key? key,required this.child, required this.animation});
//
//   final Widget child;
//   final Animation<double> animation;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedBuilder(
//         animation: animation,
//         builder: (context, child) {
//           return SizedBox(
//             height: animation.value,
//             width: animation.value,
//             child: child,
//           );
//         },
//         child: child,
//       ),
//     );
//   }
// }
// // #enddocregion GrowTransition
//
// class LogoApp extends StatefulWidget {
//   const LogoApp({super.key});
//
//   @override
//   _LogoAppState createState() => _LogoAppState();
// }
//
// // #docregion print-state
// class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller =
//         AnimationController(duration: const Duration(seconds: 2), vsync: this);
//     animation = Tween<double>(begin: 0, end: 300).animate(controller);
//     controller.forward();
//   }
//   // #enddocregion print-state
//
//   @override
//   Widget build(BuildContext context) {
//     return GrowTransition(
//       child: const LogoWidget(),
//       animation: animation,
//     );
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// // #docregion print-state
// }