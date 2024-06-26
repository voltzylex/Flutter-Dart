import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum DioMethod { post, get, put, delete }

class APIService {
  APIService._singleton();

  static final APIService instance = APIService._singleton();
  final token = "";
  String get baseUrl {
    if (kDebugMode) {
      return "https://sunilflutter.in/";
    }

    return "https://sunilflutter.in/";
  }

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    Map<String, dynamic>? param,
    String? contentType,
    formData,
    ValueChanged<double>? progress,
    ValueChanged<double>? upcomingProgress,
  }) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
      );
      switch (method) {
        case DioMethod.post:
          return dio.post(
            endpoint,
            data: param ?? formData,
            onReceiveProgress: (count1, total) {
              if (upcomingProgress != null) {
                upcomingProgress(count1 / total);
              }
            },
            onSendProgress: (int sent, int total) {
              progress!(sent / total);
            },
          );
        case DioMethod.get:
          return dio.get(
            endpoint,
            queryParameters: param,
          );
        case DioMethod.put:
          return dio.put(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.delete:
          return dio.delete(
            endpoint,
            data: param ?? formData,
          );
        default:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}
