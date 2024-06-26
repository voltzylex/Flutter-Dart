import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/dio/presentation/pages/dio_page.dart';
import 'package:state_management/riverpod/screens/home/home_screen.dart';

void main() {
  /// without provider scope it will not work
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RiverpodHomeScreen(),
                    )),
                child: const Text("Riverpod")),
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.purple[50],
            onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const DioPage(),
                )),
            child: const Text("Dio"),
          )
        ],
      ),
    );
  }

  final car = Car();
}

class Car {
  Car._();
  factory Car() => Car._();

  

  int? price;

  set setprice(int nprice) => price = nprice;

  get newPrice => price;
}
