import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_practice/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Counter())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('<-- This widget has been built this many times');
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Provider'),
        ),
        body: const HomePage(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<Counter>().increment();
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 12.0),
            FloatingActionButton(
              onPressed: () {
                context.read<Counter>().decrement();
              },
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 12.0),
            FloatingActionButton(
              onPressed: () {
                context.read<Counter>().reset();
              },
              child: const Icon(Icons.loop),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You have pushed this button this many times:',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            '${context.watch<Counter>().counter}',
            style: const TextStyle(fontSize: 22.0),
          ),
        ],
      ),
    );
  }
}
