import 'package:flutter/material.dart';
import 'package:flutter_revision/features/subscription/data/services/razorpay_service.dart';

class PaymentController extends ChangeNotifier {
  final _razorpayService = RazorpayService();

  bool isLoading = false;
  String? error;
  Map<String, dynamic>? orderResponse;

  Future<void> createOrder() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _razorpayService.createOrder({
        'amount': 499,
        'currency': 'INR',
        'receipt': 'order_rcptid_11',
        'phoneNumber': '8700499943',
      });
      orderResponse = response.data;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
