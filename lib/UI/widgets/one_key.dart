import 'package:flutter/material.dart';

class OneKey extends StatelessWidget {
  final int number;
  final Function(int) callback;

  const OneKey({super.key, required this.number, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: MaterialButton(
            key: Key(number.toString()),
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            onPressed: () {
              callback(number);
            },
            child: Text(number.toString(),
                style: const TextStyle(
                  fontSize: 26.0,
                  color: Colors.white,
                ))),
      ),
    );
  }
}
