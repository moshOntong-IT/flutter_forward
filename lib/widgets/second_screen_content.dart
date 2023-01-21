import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SecondScreenContent extends StatelessWidget {
  const SecondScreenContent({
    super.key,
    required this.stream,
    required this.items,
    this.onSpin,
    this.onDone,
  });

  final Stream<int> stream;
  final List<String> items;
  final void Function()? onSpin;
  final void Function()? onDone;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: FortuneWheel(
            selected: stream,
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
              ...items.map(
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
                onPressed: onSpin,
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
              onPressed: onDone,
              child: const Text('Done'),
            ),
          ],
        ),
      ],
    );
  }
}


