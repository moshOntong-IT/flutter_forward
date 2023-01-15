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
    return const Scaffold(
      ///The SafeArea widget in Flutter is used to ensure that the
      ///important visual elements of an app are not obscured by the
      ///device's notch or edges. The SafeArea widget is a rectangular area
      ///that is guaranteed to be free from any system UI elements such as the
      ///notch, status bar, or navigation bar.
      body: SafeArea(
        child: Text('Hello World'),
      ),
    );
  }
}
