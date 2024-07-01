import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deeplinking/router.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: goRouter,
      // routerDelegate: goRouter.routerDelegate,
      // home: const HomePage(),
      // routes: {
      //   "/login": (context) => const SecondPage(),
      // },
      // onGenerateRoute: generateRoute,
    ),
  );
}

class MainTest {
  int value = 0;
  increment() => value++;
  decrement() => --value;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appLinks = AppLinks(); // AppLinks is singleton
  @override
  void initState() {
    super.initState();
    _appLinks.uriLinkStream.listen((uri) {
      log("URi path ${uri.path} : ${uri.pathSegments} : ${uri.fragment} ");
      // Do something (navigation, ...)
      if (uri.path.contains("/details")) {
        return context.pushReplacement("/details/Osama");
      }
    });
    getInitialData();
  }

  getInitialData() async {
    final uri = await _appLinks.getInitialLink();
    log("Initial Url => ${uri?.data}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Main page"),
      ),
    );
  }
}
