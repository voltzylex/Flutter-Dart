import 'package:flutter/material.dart';
import 'package:flutter_deeplinking/deep_gorouter/first_page.dart';
import 'package:flutter_deeplinking/deep_gorouter/second_page.dart';
import 'package:go_router/go_router.dart';
import 'package:ivs_broadcaster/ivs_broadcaster.dart';

// List<CameraDescription> cameras = [];

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   cameras = await availableCameras();

//   runApp(
//     MaterialApp.router(
//       routerConfig: goRouter,
//       // routerDelegate: goRouter.routerDelegate,
//       // home: const HomePage(),
//       // routes: {
//       //   "/login": (context) => const SecondPage(),
//       // },
//       // onGenerateRoute: generateRoute,
//     ),
//   );
// }
Future<void> main() async {
  // Fetch the available cameras before initializing the app.
  // try {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   cameras = await availableCameras();
  // } on CameraException catch (e) {
  //   logError(e.code, e.description ?? "No description found");
  // }
  runApp(const GoHomePage());
  // runApp(HomePage());
  // runApp(CameraApp());
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
  // final _appLinks = AppLinks(); // AppLinks is singleton
  @override
  void initState() {
    super.initState();
    // _appLinks.uriLinkStream.listen((uri) {
    //   log("URi path ${uri.path} : ${uri.pathSegments} : ${uri.fragment} ");
    //   // Do something (navigation, ...)
    //   if (uri.path.contains("/details")) {
    //     return context.pushReplacement("/details/Osama");
    //   }
    // });
    // getInitialData();
  }

  // getInitialData() async {
  //   final uri = await _appLinks.getInitialLink();
  //   log("Initial Url => ${uri?.data}");
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home page"),
        ),
        body: const Center(
          child: Text("Home page"),
        ),
      ),
    );
  }
}

class GoHomePage extends StatelessWidget {
  const GoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

final router = GoRouter(debugLogDiagnostics: true, routes: [
  GoRoute(path: '/', builder: (context, state) => const FirstPage(), routes: [
    GoRoute(
      path: 'second',
      builder: (context, state) => const SecondPage2(),
    )
  ]),
]);
