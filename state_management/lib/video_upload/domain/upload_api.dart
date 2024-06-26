import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:state_management/video_upload/domain/api_services.dart';

Future<void> uploadVideoRequest(File file,String fileName) async {
  log("Upload video request called : File name is : $fileName", name: "Upload video called");
  try {
    var data = FormData.fromMap({
      'file': [
        await MultipartFile.fromFile(
          file.path,
        )
      ],
      'name': fileName
    });
    final response = await APIService.instance.request(
      '/api/uploader.php',
      DioMethod.post,
      // param: {'email': email, 'password': password},
      formData: data,

      contentType: 'application/json',
      progress: (value) {
        print("Upload progress $value");
      },
    );
    if (response.statusCode == 200) {
      log('API call successful: ${response.data}');
    } else {
      log('API call failed: ${response.statusMessage}');
    }
  } catch (e) {
    log('Network error occurred: $e');
  }
}

Future<void> moveFileToDownloads(String fileName) async {
  try {
    // Get the temporary directory (cache directory in this case)
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    // Construct the path to the file in the cache directory
    String filePathInCache = tempPath;
    // '$tempPath/$fileName';
    log("File name is : $filePathInCache", name: "File name");
    // Check if the file exists in the cache directory
    bool fileExists = await File(fileName).exists();
    if (!fileExists) {
      log('File does not exist in cache directory');
      return;
    }

    // Get the downloads directory
    Directory? downloadsDir = await getDownloadsDirectory();
    // getDownloadsDirectory();
    String downloadsPath = downloadsDir!.path;

    // Construct the destination path in the downloads directory
    String destinationPath = downloadsPath;
    // '$downloadsPath/$fileName';
    log("Download path : $destinationPath", name: "Download path");
    // Create a File instance for the file in cache
    File fileInCache = File(filePathInCache);

    // Move the file using the copy and delete methods
    await fileInCache.copy(destinationPath);
    await fileInCache.delete();

    log('File moved to downloads successfully', name: "File Moved");
  } catch (e) {
    log('Error while moving file: $e', name: "File Moved");
  }
}
