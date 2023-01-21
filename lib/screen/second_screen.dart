import 'dart:async';
import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:random_name_generator/random_name_generator.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    super.key,
    required this.randomToGenerate,
  });
  final int randomToGenerate;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late final StreamController<int> controller;

  String? result;

  @override
  void initState() {
    super.initState();
    log('Second Screen: initState');

    controller = StreamController<int>();
  }

  @override
  void dispose() {
    super.dispose();
    log('Second Screen: dispose');
    controller.close();
  }

  Future<List<String>> _generateRandomNames() async {
    await Future.delayed(const Duration(seconds: 5));

    // random number if below 0.5 then Future.error
    if (Random().nextDouble() < 0.5) {
      return Future.error('Error');
    }

    final randomNames = RandomNames(Zone.us);
    final items = List.generate(
        widget.randomToGenerate, (index) => randomNames.surname());

    return items;
  }

  @override
  Widget build(BuildContext context) {
    log('Second Screen: build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: FutureBuilder<List<String>>(
            future: _generateRandomNames(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FortuneWheel(
                        selected: controller.stream,
                        animateFirst: false,
                        items: [
                          /// * The three dots (...) inside of the items
                          /// * list is the spread operator. It is used to expand
                          /// * the elements of an iterable (such as a list or a set)
                          /// * into individual elements of a new list.
                          /// * In this case, the items.map() method is used to create
                          /// * a new list of FortuneItem widgets, with each widget
                          /// * containing a Text widget with the value of the
                          /// * corresponding item from the items list. The spread
                          /// * operator is then used to expand this new list of
                          /// * FortuneItem widgets into the items list, so that each
                          /// * widget in the new list becomes an individual element in
                          /// * the items list.
                          ...snapshot.data!.map(
                            (item) => FortuneItem(
                              child: Text(item),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              final randomWinnerIndex =
                                  Fortune.randomInt(0, widget.randomToGenerate);
                              result = snapshot.data![randomWinnerIndex];
                              controller.add(randomWinnerIndex);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text('Spin'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, result);
                          },
                          child: const Text('Done'),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Text('Something went wrong');
              }
            }),
      ),
    );
  }
}
