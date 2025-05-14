import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_revision/features/home/widgets/home_app_bar.dart';
import 'package:flutter_revision/features/home/widgets/home_card.dart';
import 'package:flutter_revision/features/home/widgets/mood_box.dart';
import 'package:flutter_revision/features/home/widgets/progress_bar.dart';
import 'package:flutter_revision/features/home/widgets/seven_day_streak.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 15),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              const SizedBox(height: 20),
              SevenDayStreak(),
              const SizedBox(height: 40),
              DailyProgress(currentValue: 70),
              const SizedBox(height: 40),
              MoodSelector(),
              const SizedBox(height: 20),
              TimelineItem(
                title: 'Lift Emotional Burden',
                duration: '5 Mins',
                tag: 'Better Sleep',
                imgSrc: 'assets/images/krishna.png',
                buttonLabel: 'Listen Now',
                isLast: false,
                isActive: true,
                isCompleted: true,
              ),
              TimelineItem(
                title: 'Prayer of the Day',
                duration: '5 Mins',
                tag: 'Love',
                imgSrc: 'assets/images/second.png',
                buttonLabel: 'Pray Now',
                isLast: false,
                isActive: true,
                isPrayerScreen: true,
              ),
              TimelineItem(
                title: 'Shiv Nidra Journey - Day 1',
                duration: '5 Mins',
                tag: 'Better Sleep',
                imgSrc: 'assets/images/third.png',
                buttonLabel: 'Listen Now',
                isLast: true,
              ),
              const SizedBox(height: 20),
              Image.asset(
                width: 42,
                height: 42,
                'assets/images/om.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text(
                "The Easiest Way to \nMeditate with \nGod!",
                style: AppTextStyles.heading.copyWith(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF5D6879),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
