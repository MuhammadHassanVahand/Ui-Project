import 'package:flutter/material.dart';
import 'package:mini_ui_project/get_started.dart';
import 'package:mini_ui_project/widget/home_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GetStarted(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sliding Up Panel Example'),
//       ),
//       body: SlidingUpPanel(
//         panel: Center(
//           child: Text('This is the panel content'),
//         ),
//         collapsed: Container(
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(24.0),
//               topRight: Radius.circular(24.0),
//             ),
//           ),
//           child: Center(
//             child: Text('Slide Up'),
//           ),
//         ),
//         body: Center(
//           child: Text('Main Content'),
//         ),
//       ),
//     );
//   }
// }
