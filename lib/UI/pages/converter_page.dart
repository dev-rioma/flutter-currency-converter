import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import '../../utils//constants.dart';
import '../widgets/selection_item.dart';
import '../widgets/key_pad.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  int currency1 = 1;
  int currency2 = 0;

  List<Widget> _buildItems() {
    return currencies
        .map((val) => SelectionItem(
              title: val,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Currency converter'),
        ),
        body: Column(children: [
          Row(
            children: [
              Expanded(
                child: DirectSelect(
                    itemExtent: 45.0,
                    selectedIndex: currency1,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        currency1 = index ?? 0;
                      });
                    },
                    items: _buildItems(),
                    child: SelectionItem(
                      isForList: false,
                      title: currencies[currency1],
                    )),
              ),
              Expanded(
                  child: DirectSelect(
                itemExtent: 45.0,
                selectedIndex: currency2,
                backgroundColor: Theme.of(context).colorScheme.primary,
                onSelectedItemChanged: (index) {
                  setState(() {
                    currency2 = index ?? 0;
                  });
                },
                items: _buildItems(),
                child: SelectionItem(
                  isForList: false,
                  title: currencies[currency2],
                ),
              ))
            ],
          ),
          Expanded(
              child: Center(
            child: KeyPad(
                textCurrency1: currencies[currency1],
                textCurrency2: currencies[currency2],
                rate: rates[currency1][currency2]),
          ))
        ]));
  }
}
