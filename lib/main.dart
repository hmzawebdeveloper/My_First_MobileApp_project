// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'first_screen.dart';

// void main() {
//   runApp(const MyApp());
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FirstScreen(), // Agar yeh file exist karti hai tabhi chalega
//     );
//   }

// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FirstScreen());
  }
}
