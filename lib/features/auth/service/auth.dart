import 'package:dio/dio.dart';
import 'package:flutter_revision/core/dio/dio.dart';

class AuthService {
  final Dio _dio = DioClient().dio;

  Future<Response> sendOtp({required String phone}) async {
    try {
      return await _dio.post('/auth/send-otp', data: {'phone': phone});
    } catch (e) {
      throw Exception('Failed to create order');
    }
  }

  Future<Response> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      return await _dio.post(
        '/auth/verify-otp',
        data: {'phone': phone, 'otp': otp},
      );
    } catch (e) {
      throw Exception('Failed to create order');
    }
  }
}
