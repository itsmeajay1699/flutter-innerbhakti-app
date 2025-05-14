import 'package:flutter/material.dart';
import 'package:flutter_revision/features/auth/service/auth.dart';
// import 'package:flutter_revision/service/auth/auth_service.dart';

class AuthController extends ChangeNotifier {
  final _authService = AuthService();

  bool isLoading = false;
  String? error;
  Map<String, dynamic>? sendOtpResponse;
  Map<String, dynamic>? verifyOtpResponse;

  Future<void> sendOtp({required String phone}) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _authService.sendOtp(phone: phone);
      sendOtpResponse = response.data;
    } catch (e) {
      error = e.toString();
      notifyListeners();
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> verifyOtp({required String phone, required String otp}) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _authService.verifyOtp(phone: phone, otp: otp);
      verifyOtpResponse = response.data;
    } catch (e) {
      error = e.toString();
      notifyListeners();
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
