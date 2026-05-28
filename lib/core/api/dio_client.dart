import 'package:dio/dio.dart';
import 'api_endpoints.dart';
import 'api_interceptors.dart';

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 120),
        contentType: 'application/json',
        responseType: ResponseType.json,
        headers: {
          'ngrok-skip-browser-warning': 'true',
        },
      ),
    );

    // Branchement de l'intercepteur unique
    dio.interceptors.add(ApiInterceptors());
  }
}