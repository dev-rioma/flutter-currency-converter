import 'package:flutter/material.dart';
import 'one_key.dart';

class KeyPad extends StatefulWidget {
  final String textCurrency1;
  final String textCurrency2;
  final String rate;

  const KeyPad(
      {super.key,
      required this.textCurrency1,
      required this.textCurrency2,
      required this.rate});

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  double _currency2 = 0;
  int _currency1 = 0;

  void _onPressed(int k) {
    setState(() {
      if (k == 10) {
        print("vamos1");
      } else {
        print("vamos2");
      }
    });
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currency2 = 0;
    _currency1 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.textCurrency1),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerRight,
              child: Text(
                _currency1.toString(),
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 35),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('se muestra textCurrency1'),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerRight,
              child: Text(
                num.parse(_currency2.toStringAsFixed(4)).toString(),
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 35),
              ),
            )
          ],
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // const Text("OneKey para 7, 8 y 9"),
              OneKey(number: 7, callback: _onPressed),
              OneKey(number: 8, callback: _onPressed),
              OneKey(number: 9, callback: _onPressed)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // const Text("OneKey para 6, 5 y 4"),
              OneKey(number: 6, callback: _onPressed),
              OneKey(number: 5, callback: _onPressed),
              OneKey(number: 4, callback: _onPressed)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text("OneKey para 1, 2 y 3"),
              OneKey(number: 1, callback: _onPressed),
              OneKey(number: 2, callback: _onPressed),
              OneKey(number: 3, callback: _onPressed),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: MaterialButton(
                key: const Key("reset"),
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  _onPressed(10);
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
            // const Text("oneKey para 0")
            OneKey(number: 0, callback: _onPressed),
          ]),
        )
      ],
    );
  }
}
