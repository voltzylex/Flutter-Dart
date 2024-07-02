// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_deeplinking/main.dart';

// class CameraWidget extends StatefulWidget {
//   const CameraWidget({super.key});

//   @override
//   State<CameraWidget> createState() => _CameraWidgetState();
// }

// class _CameraWidgetState extends State<CameraWidget> {
//   late CameraController _camera;
//   @override
//   void initState() {

//     super.initState();
//      _camera = CameraController(cameras[0], ResolutionPreset.max);
//     _camera.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     }).catchError((Object e) {
//       if (e is CameraException) {
//         switch (e.code) {
//           case 'CameraAccessDenied':
//             // Handle access errors here.
//             break;
//           default:
//             // Handle other errors here.
//             break;
//         }
//       }
//     });
//   }
//     @override
//   void dispose() {
//     _camera.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//           SizedBox(
//               height: 500,
//               width: 300,
//               child: !_camera.value.isInitialized
//                   ? Container()
//                   : CameraPreview(_camera)),
         
//       ],
//     );
//   }
// }