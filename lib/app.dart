import 'package:flutter/material.dart';
import 'package:flutter_forward/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /// Container is a widget that allows you to customize its child.
      home: const HomeScreen(),
    );
  }
}
