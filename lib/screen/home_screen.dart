import 'dart:developer';

import 'package:flutter/material.dart';

import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    log('initState');
  }

  @override
  dispose() {
    super.dispose();
    log('dispose');
  }

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
                  if (counter < 3) {
                    return;
                  }

                  /// * when we use and async and await here, we will get an
                  /// * lint warning, it says that "Do not use BuildContext"
                  /// * accross async gaps. To bypass this warning, we can
                  /// * use the [then] method of the Future class.
                  /// ! final result = await Navigator.push<String>(
                  /// !   context,
                  /// !   MaterialPageRoute(
                  /// !     builder: (context) => SecondScreen(
                  /// !       randomToGenerate: counter,
                  /// !     ),
                  /// !   ),
                  /// ! );

                  /// ! ScaffoldMessenger.of(context).showSnackBar(
                  /// !   SnackBar(
                  /// !     content: Text(result ?? 'No result'),
                  /// !   ),
                  /// ! );

                  Navigator.push<String>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                          randomToGenerate: counter,
                        ),
                      )).then((result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Congratulations $result  🎉🎉🎉'),
                      ),
                    );

                    setState(() {
                      counter = 0;
                    });
                  });

                  /// * The then() method is a way to handle the result of a
                  /// * Future as soon as it completes. This is useful when you
                  /// * need to perform some action after a Future completes,
                  /// * such as updating the UI, or triggering another asynchronous
                  /// *  operation.
                },
                child: const Text('Go to spin wheel'),
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
