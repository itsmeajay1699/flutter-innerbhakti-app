import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_revision/features/home/view/play_audio.dart';
import 'package:flutter_revision/features/home/widgets/dashed_line.dart';
import 'package:flutter_revision/features/prayer/view/single_prayer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';

class TimelineItem extends StatelessWidget {
  final String title;
  final String duration;
  final String tag;
  final String imgSrc;
  final String buttonLabel;
  final bool isFirst;
  final bool isLast;
  final bool isActive;
  final bool isCompleted;
  final bool isPrayerScreen;

  const TimelineItem({
    super.key,
    required this.title,
    required this.duration,
    required this.tag,
    required this.imgSrc,
    required this.buttonLabel,
    this.isFirst = false,
    this.isLast = false,
    this.isActive = false,
    this.isCompleted = false,
    this.isPrayerScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              isPrayerScreen
                                  ? SinglePrayerScreen()
                                  : AudioPlayerScreen(imageUrl: imgSrc),
                    ),
                  );
                },
                child: Container(
                  height: 155,
                  margin: const EdgeInsets.only(bottom: 20, left: 15),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(239, 66, 54, 0.1),
                        offset: Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(251, 175, 64, 0.08),
                        offset: Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 0,
                      ),
                    ],
                    color: Color(0xFFFFFAE6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFF121212),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$duration • $tag',
                              style: AppTextStyles.body.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xFF5D6879),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF121212),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  !isPrayerScreen
                                      ? Image.asset(
                                        'assets/images/play.png',
                                        width: 16,
                                        height: 16,
                                      )
                                      : const SizedBox.shrink(),
                                  !isPrayerScreen
                                      ? const SizedBox(width: 8)
                                      : const SizedBox.shrink(),
                                  Text(
                                    buttonLabel,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(imgSrc, fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 0,
          top: 70,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isCompleted
                          ? Color(0xFFEF6820)
                          : isActive
                          ? Color(0xFFF49B6A)
                          : Colors.white,
                  border: Border.all(
                    color:
                        isCompleted
                            ? Colors.transparent
                            : isActive
                            ? Color(0xFFEF6820)
                            : Color(0xFF5D6879),
                    width: 2,
                  ),
                ),
                child:
                    isCompleted
                        ? HeroIcon(
                          HeroIcons.check,
                          style: HeroIconStyle.solid,
                          color: Colors.white,
                        )
                        : const SizedBox.shrink(),
              ),
              if (!isLast)
                Container(
                  margin: const EdgeInsets.only(left: 3, top: 4),
                  width: 3,
                  height: 145,
                  child: CustomPaint(
                    painter: DashedLinePainter(
                      color:
                          isCompleted ? Color(0xFFEF6820) : Color(0xFFE4E4E4),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
