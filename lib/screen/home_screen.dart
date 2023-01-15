import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    ///* When the setState method is called, the widget's build method is triggered,
    ///*  which causes the widget to be rebuilt with the updated state.
    ///* This process is known as rebuilding the widget tree.
    ///* Therefore, the int counter variable must be not here inside the build method.
    ///*  It must be outside the build method.
    /// ! int counter = 0;

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
            ///*  when a button is pressed and the onPressed callback contains
            ///* a call to setState, the state of the widget is updated and
            ///* the widget's build method is triggered.
            setState(() {
              counter++;
            });

            log('You have pushed the button this many times: $counter');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
