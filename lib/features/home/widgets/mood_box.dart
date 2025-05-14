import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoodSelector extends StatefulWidget {
  const MoodSelector({super.key});

  @override
  State<MoodSelector> createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> moods = [
    {'label': 'Very Sad', 'icon': Icons.sentiment_very_dissatisfied},
    {'label': 'Neutral', 'icon': Icons.sentiment_neutral},
    {'label': 'Happy', 'icon': Icons.sentiment_satisfied_alt},
    {'label': 'Joyful', 'icon': Icons.sentiment_satisfied},
    {'label': 'Awesome', 'icon': Icons.sentiment_very_satisfied},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(0xFFFFFAE6),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x26121212),
            offset: Offset(0, 2),
            blurRadius: 1,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How are you feeling today?',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF121212),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(moods.length, (index) {
              final mood = moods[index];
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () => setState(() => selectedIndex = index),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 60, minHeight: 58),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 4.w,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color:
                            isSelected ? Color(0xFFEF6821) : Colors.transparent,
                        width: 1.w,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          mood['icon'],
                          size: 26.sp,
                          color: isSelected ? Color(0xFFEF6920) : Colors.black,
                        ),
                        Text(
                          mood['label'],
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w800,
                            color:
                                isSelected ? Color(0xFFEF6920) : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
