import 'dart:async';
import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_forward/widgets/second_screen_content.dart';
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
                return SecondScreenContent(
                  stream: controller.stream,
                  items: snapshot.data!,
                  onSpin: () {
                    final randomWinnerIndex =
                        Fortune.randomInt(0, widget.randomToGenerate);
                    result = snapshot.data![randomWinnerIndex];
                    controller.add(randomWinnerIndex);
                  },
                  onDone: () {
                    Navigator.pop(context, result);
                  },
                );
              } else {
                return const Text('Something went wrong');
              }
            }),
      ),
    );
  }
}
