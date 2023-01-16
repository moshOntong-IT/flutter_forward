import 'dart:developer';

import 'package:flutter/material.dart';

import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times: $counter',
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                    ),
                  );
                },
                child: const Text('Go to second screen'),
              ),
            ],
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
