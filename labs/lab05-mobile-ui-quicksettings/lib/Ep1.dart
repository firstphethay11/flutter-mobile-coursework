// ignore: file_names
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

      theme: ThemeData.dark(),

      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),

      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              for (int row = 0; row < 10; row++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int col = 1; col <= 10; col++)
                      SizedBox(
                        width: 30,
                        height: 60,
                        child: Center(
                          child: Text(
                            '${row * 10 + col}',
                            style: TextStyle(
                              color:
                                  Colors.primaries[(row * 10 + col) %
                                      Colors.primaries.length],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
        // bottomNavigationBar: BottomAppBar(
        //   shape: const CircularNotchedRectangle(),

        //   child: Container(height: 50),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,

        //   tooltip: 'Increment',

        //   child: const Icon(Icons.add),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
