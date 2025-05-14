import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late Dio dio;

  DioClient._internal() {
    BaseOptions options = BaseOptions(
      // baseUrl: 'https://staging.innerbhakti.com/api/v1',
      // baseUrl: 'http://localhost:5000/api/v1/',
      baseUrl: 'http://10.5.54.201:5000/api/v1/',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    );

    dio = Dio(options);

    // Add interceptors if needed
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}
