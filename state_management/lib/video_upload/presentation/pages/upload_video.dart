import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:state_management/video_upload/domain/upload_api.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Video"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: IconButton(
              onPressed: () async {
                FilePicker fPicker = FilePicker.platform;
                fPicker.clearTemporaryFiles();

                FilePickerResult? result = await fPicker.pickFiles(
                  type: FileType.video,
                  allowCompression: false,
                );

                if (result != null) {
                  setState(() {
                    file = File(result.files.single.path!);
                  });
                } else {
                  // User canceled the picker
                }
              },
              icon: const Icon(Icons.add),
            ),
          ),
          if (file != null)
            ElevatedButton(
                onPressed: () async {
                  try {
                    final tempPath = await getApplicationDocumentsDirectory();
                    String name = file?.path.split("tmp/").last ?? "video1.mov";
                    file!.copySync("${tempPath.path}/$name");

                    log("Uploaded path is ${file?.path} and file name is ${file?.path.split("tmp/").last}");
                    log("Temp path is ${tempPath.path}");
                    final videos = tempPath.listSync();
                    log("list are ${videos.first}");
                    await uploadVideoRequest(File(videos.first.path), name);
                  } on Exception catch (e) {
                    log("Exception $e");
                  }
                },
                child: const Text("Upload Video"))
        ],
      ),
    );
  }
}
