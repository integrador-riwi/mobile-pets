import 'package:dio/dio.dart';

import '../config/env.dart';

class ApiClient {
  ApiClient() : dio = _build();

  final Dio dio;

  static Dio _build() {
    return Dio(
      BaseOptions(
        baseUrl: Env.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: 'application/json',
        responseType: ResponseType.json,
        validateStatus: (status) => status != null && status < 500,
      ),
    );
  }
}
