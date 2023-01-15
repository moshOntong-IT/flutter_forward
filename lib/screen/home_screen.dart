import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;

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
        body: Center(
          child: Text(
            'You have pushed the button this many times: $counter',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter++;
            log('You have pushed the button this many times: $counter');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
