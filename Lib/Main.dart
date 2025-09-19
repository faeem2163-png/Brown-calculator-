import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "0";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
    } else if (buttonText == "=") {
      try {
        _output = (double.parse(output)).toString();
      } catch (e) {
        _output = "Error";
      }
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }

    setState(() {
      output = _output;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(buttonText, style: TextStyle(fontSize: 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Brown Calculator")),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(output, style: TextStyle(fontSize: 48)),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(children: [
            Row(children: [buildButton("7"), buildButton("8"), buildButton("9"), buildButton("/")]),
            Row(children: [buildButton("4"), buildButton("5"), buildButton("6"), buildButton("x")]),
            Row(children: [buildButton("1"), buildButton("2"), buildButton("3"), buildButton("-")]),
            Row(children: [buildButton("."), buildButton("0"), buildButton("00"), buildButton("+")]),
            Row(children: [buildButton("CLEAR"), buildButton("=")]),
          ])
        ],
      ),
    );
  }
}
