import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
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
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _studentNameController = TextEditingController();
  final _listviewscrollController = ScrollController();
  List<String> entries = <String>[];

  void _addStudent() {
    setState(() {
      entries.add(
        '${_studentIdController.text}   ${_studentNameController.text}',
      );
      _studentIdController.clear();
      _studentNameController.clear();
      entries.sort((a, b) => a.compareTo(b));
      _listviewscrollController.animateTo(
        _listviewscrollController.position.maxScrollExtent + 25,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOut,
        
      );
    });
  }

  Future<String> getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> saveToFile() async {
    final path = await getFilePath();
    final file = File('$path/students.txt');
    final sink = file.openWrite();
    for (var entry in entries) {
      sink.writeln(entry);
    }
    await sink.flush();
    await sink.close();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: entries.length > 0
                ? ListView.builder(
                    controller: _listviewscrollController,
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 40,
                        //                        color: Colors.amber[colorCodes[index]],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(entries[index]),
                            IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () {
                                setState(() {
                                  entries.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const Center(child: Text('No Student Found')),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                TextField(
                  controller: _studentIdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'รหัสนักศึกษา',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _studentNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ชื่อ-นามสกุล',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStudent,
        tooltip: 'Add Student',
        child: const Icon(Icons.add),
      ),
    );
  }
}
