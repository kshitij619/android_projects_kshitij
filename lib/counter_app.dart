import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: CounterApp(),
      )));
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});
  @override
  State<StatefulWidget> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Counter Value',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          Text(
            '$_counter',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _decrementCounter,
                child: Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
}
