// import 'dart:developer';

// import 'package:flutter_deeplinking/main.dart';
// import 'package:flutter_deeplinking/second_page.dart';
// import 'package:go_router/go_router.dart';

// final goRouter = GoRouter(
//   debugLogDiagnostics: true,
//   redirect: (context, state) {
//     // Subscribe to all events (initial link and further)
//     log("Router state is ${state.fullPath}");
//     return null;
//   },
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const HomePage(),
//       routes: [
//         GoRoute(
//           path: 'details/:itemId',
//           builder: (context, state) =>
//               SecondPage(id: state.pathParameters['itemId'] ?? "no item"),
//         )
//       ],
//     )
//   ],
// );
