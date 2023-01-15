import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///* In Flutter, a scaffold is a basic skeletal structure that provides
    ///* support for visual elements such as the app bar, bottom navigation bar,
    ///* and floating action button. It also provides a framework to implement
    ///* drawer and bottom sheet behavior. The Scaffold widget is a Material
    ///* Design container that provides a visual structure for an app's layout.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello',
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.blue,
              height: 100,
              width: 100,
            ),
          ),

          ///* The SizedBox widget that is used in the provided code snippet
          ///* is used to create a fixed amount of empty space between the two
          ///* Container widgets. The height property of the SizedBox widget is
          ///* set to 50, which means that there will be 50 pixels of empty
          ///* space between the two Container widgets.
          const SizedBox(
            width: 50,
          ),
          Center(
            child: Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
