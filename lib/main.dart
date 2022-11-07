import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Currency Converter'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _calculator {
  final titles;
  final color;
  final icon;

  _calculator(this.titles, this.color, this.icon);
}

final textOrigin = TextEditingController();
final textDestiny = TextEditingController();

String op1 = "USD";
String op2 = "USD";

currencyEject() {
  if (op1 == "USD" && op2 == "COP") {
    textDestiny.text = (double.parse(textOrigin.text) * 5000).toString();
  } else if (op1 == "COP" && op2 == "USD") {
    textDestiny.text = (double.parse(textOrigin.text) / 5000).toString();
  } else if (op1 == "EUR" && op2 == "COP") {
    textDestiny.text = (double.parse(textOrigin.text) * 4900).toString();
  } else if (op1 == "COP" && op2 == "EUR") {
    textDestiny.text = (double.parse(textOrigin.text) / 4900).toString();
  } else if (op1 == "USD" && op2 == "EUR") {
    textDestiny.text = (double.parse(textOrigin.text) / 0.98).toString();
  } else if (op1 == "EUR" && op2 == "USD") {
    textDestiny.text = (double.parse(textOrigin.text) * 0.98).toString();
  } else if (op1 == op2) {
    textDestiny.text = (double.parse(textOrigin.text) * 1).toString();
  }
}

List<DropdownMenuItem<String>> currency = <DropdownMenuItem<String>>[
  DropdownMenuItem(value: "USD", child: Text("USD")),
  DropdownMenuItem(value: "EUR", child: Text("EUR")),
  DropdownMenuItem(value: "COP", child: Text("COP")),
];

List<_calculator> cal = <_calculator>[
  _calculator("7", Colors.transparent, Icon(Icons.abc)),
  _calculator("8", Colors.transparent, Icon(Icons.abc)),
  _calculator("9", Colors.transparent, Icon(Icons.abc)),
  _calculator("4", Colors.transparent, Icon(Icons.abc)),
  _calculator("5", Colors.transparent, Icon(Icons.abc)),
  _calculator("6", Colors.transparent, Icon(Icons.abc)),
  _calculator("1", Colors.transparent, Icon(Icons.abc)),
  _calculator("2", Colors.transparent, Icon(Icons.abc)),
  _calculator("3", Colors.transparent, Icon(Icons.abc)),
  _calculator("0", Colors.transparent, Icon(Icons.abc)),
  _calculator(
      "AC", Colors.transparent, Icon(Icons.delete, color: Colors.amber)),
  _calculator("eliminar", Colors.transparent,
      Icon(Icons.backspace, color: Colors.amber))
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text("Origen :"),
                DropdownButton(
                    value: op1,
                    items: currency,
                    onChanged: (String? X) {
                      setState(() {
                        op1 = X.toString();
                      });
                    }),
                Text("Destino : "),
                DropdownButton(
                    value: op2,
                    items: currency,
                    onChanged: (String? X) {
                      setState(() {
                        op2 = X.toString();
                      });
                    })
              ],
            ),
            TextField(
              controller: textOrigin,
              decoration: const InputDecoration(
                labelText: "Moneda origen",
                hintText: "0",
                icon: Icon(Icons.monetization_on_outlined),
              ),
            ),
            TextField(
              controller: textDestiny,
              decoration: const InputDecoration(
                labelText: "Moneda Destino",
                hintText: "0",
                icon: Icon(Icons.monetization_on_outlined),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(50),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: cal.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: cal[index].color,
                    child: ListTile(
                      title: Center(
                        child: index > 9
                            ? cal[index].icon
                            : Text(
                                cal[index].titles,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 35),
                              ),
                      ),
                      onTap: () {
                        if (index == 10) {
                          textOrigin.text = "";
                          // currencyEject();
                          textDestiny.text = "";
                        } else if (index < 10) {
                          textOrigin.text = textOrigin.text + cal[index].titles;
                          currencyEject();
                        } else if (index == 11) {
                          if (textOrigin.text == "") {
                            textOrigin.text = "";
                            textDestiny.text = "";
                            currencyEject();
                          } else {
                            final pos = textOrigin.text.length - 1;
                            textOrigin.text = textOrigin.text.substring(0, pos);
                            currencyEject();
                          }
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
