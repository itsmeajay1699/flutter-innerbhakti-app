import 'package:dio/dio.dart';
import 'package:flutter_revision/core/dio/dio.dart';

class RazorpayService {
  final Dio _dio = DioClient().dio;

  Future<Response> createOrder(Map<String, dynamic> orderData) async {
    try {
      return await _dio.post('/razorpay/order', data: orderData);
    } catch (e) {
      throw Exception('Failed to create order');
    }
  }

  Future<Response> verifyPayment(Map<String, dynamic> paymentData) async {
    try {
      return await _dio.post('/razorpay/verify', data: paymentData);
    } catch (e) {
      throw Exception('Payment verification failed');
    }
  }
}
