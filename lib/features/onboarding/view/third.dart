import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_revision/features/home/view/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final List<String> genderOptions = [
    'Less than 25 years',
    '25-34 years',
    '35-44 years',
    '45-54 years',
    '55-64 years',
  ];
  String selectedGender = 'Less than 25 years'; // default selected
  Widget _buildRadioTile(String gender) {
    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color:
              selectedGender == gender ? Color(0xFFFFF3F0) : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                selectedGender == gender
                    ? Color(0xFFEF6920)
                    : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Radio<String>(
              value: gender,
              groupValue: selectedGender,
              onChanged: (value) => setState(() => selectedGender = value!),
              activeColor: Color(0xFFEF6920),
            ),
            Text(
              gender,
              style: AppTextStyles.title.copyWith(
                fontSize: 16,
                color: Color(0xFF121212),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
          "Profile",
          style: AppTextStyles.title.copyWith(
            color: Color(0xFF5D6879),
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        child: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'How old are you, Anurag?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF121212),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...genderOptions.map((item) => _buildRadioTile(item)),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                 context.go('/home');
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF6920),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: AppTextStyles.subBody.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
