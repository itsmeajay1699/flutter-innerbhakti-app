import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(child: OTPForm()),
    );
  }
}

class OTPForm extends StatefulWidget {
  const OTPForm({super.key});

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  Widget _buildOtpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 48.w,
          height: 55.h,
          child: KeyboardListener(
            focusNode: FocusNode(),
            child: TextField(
              textAlign: TextAlign.center,
              maxLength: 1,
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: const Color(0xFFF2F2F2),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFEF6920),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.arrow_back, size: 28),
          const SizedBox(height: 30),
          Center(
            child: Column(
              children: [
                Text(
                  'Enter One Time Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                    color: const Color(0xFF121212),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'OTP code sent to +91XXXXXXXXXX',
                  style: TextStyle(
                    color: const Color(0xFF5D6879),
                    fontSize: 14.sp,
                  ),
                ),
                const SizedBox(height: 30),
                _buildOtpFields(),
                const SizedBox(height: 20),
                Text(
                  "Haven't received OTP yet?",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(
                      color: Color(0xFF096EF9),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.push('/subscription');
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: const Color(0xFFEF6920),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Text(
                  "Verify",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
