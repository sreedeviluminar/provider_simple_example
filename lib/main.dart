import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_example/provider/counter_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter Value: ${counterProvider.counter.value}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                counterProvider.increment();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
