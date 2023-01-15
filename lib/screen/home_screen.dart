import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///In Flutter, a scaffold is a basic skeletal structure that provides
    ///support for visual elements such as the app bar, bottom navigation bar,
    ///and floating action button. It also provides a framework to implement
    ///drawer and bottom sheet behavior. The Scaffold widget is a Material
    ///Design container that provides a visual structure for an app's layout.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello',
        ),
      ),

      ///notch, status bar, or navigation bar. as the
      body: const SafeArea(
        child: Center(
          child: Text(
            'Hello World',
          ),
        ),
      ),
    );
  }
}
