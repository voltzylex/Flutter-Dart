import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as p;
import 'package:to_do_application/view/hive_page/view/hive_task_page.dart';
import 'package:to_do_application/view/home_page.dart';
import 'package:to_do_application/view/sqf_page/view/sqf_taskpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await p.getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;
  runApp(const MyApp());
}

getApplicationDocumentsDirectory() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TodoListScreen(),
                      )),
                  child: const Text("To Do Page")),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskPage(),
                      )),
                  child: const Text("SQF Task Page")),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HiveTaskPage(),
                      )),
                  child: const Text("HIVE Task  Page")),
            ],
          ),
        ],
      ),
    );
  }
}
