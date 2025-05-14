import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SevenDayStreak extends StatelessWidget {
  SevenDayStreak({super.key});

  final streakList = [
    {"day": 29, "streak": 0.2, "dayName": "Mon"},
    {"day": 30, "streak": 0.4, "dayName": "Tue"},
    {"day": 31, "streak": 0.6, "dayName": "Wed"},
    {"day": 1, "streak": 0.8, "dayName": "Thu"},
    {"day": 2, "streak": 1.0, "dayName": "Fri"},
    {"day": 3, "streak": 0.5, "dayName": "Sat"},
    {"day": 4, "streak": 0.3, "dayName": "Sun"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Row(
        children: [
          ...streakList.map(
            (streak) => Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    streak["dayName"].toString(),
                    style: AppTextStyles.body.copyWith(
                      fontSize: 14.sp,
                      color: Color(0xFF5D6879),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  CircularPercentIndicator(
                    radius: 20.0,
                    lineWidth: 5.0,
                    percent: streak["streak"] as double,
                    center: Text(
                      "${streak["day"]}",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color:
                            streak["streak"] as double >= 0.5
                                ? const Color(0xFF09A452)
                                : const Color(0xFFFFC803),
                      ),
                    ),
                    progressColor:
                        streak["streak"] as double >= 0.5
                            ? const Color(0xFF09A452)
                            : const Color(0xFFFFC803),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
