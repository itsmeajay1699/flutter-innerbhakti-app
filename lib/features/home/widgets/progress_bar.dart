import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyProgress extends StatelessWidget {
  final int currentValue;

  const DailyProgress({super.key, required this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Progress Today",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF121212),
              ),
            ),
            Text(
              "$currentValue%",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF5D6879),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Container(
          height: 8.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFE5E5E5),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: currentValue / 100,
            child: Container(
              height: 8.h,
              decoration: BoxDecoration(
                color: const Color(0xFFFFC803),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
