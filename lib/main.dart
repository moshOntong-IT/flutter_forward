import 'package:flutter/material.dart';

/// In the Flutter framework, the main() function serves as the entry point
/// for the app. It is where the app initializes and sets up any necessary
///  resources before calling runApp(), which takes in the root widget of the
/// app and begins executing the app.
void main() {
  ///The const keyword in Dart is used to indicate that a variable or object
  ///is a compile-time constant. This means that its value is determined at
  ///compile-time and cannot be changed at runtime. Using const can improve
  ///performance by allowing the compiler to make certain optimizations and can
  ///also help prevent accidental changes to the value.
  runApp(const MyApp());
}

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
      home: Container(
        child: const Text('Hello World'),
      ),
    );
  }
}
