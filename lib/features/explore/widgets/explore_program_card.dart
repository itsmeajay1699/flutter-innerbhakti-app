import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_revision/features/track/view/track.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ShivNidraCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String durationText;
  final double? progress;
  final String? progressText;
  final String imagePath;

  const ShivNidraCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.durationText,
    this.progress,
    this.progressText,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CourseProgressScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
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
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.title.copyWith(
                            fontSize: 18,
                            height: 1.1,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF121212),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: AppTextStyles.subBody.copyWith(
                            fontSize: 14,
                            height: 1.1,
                            color: Color(0xFF5D6879),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(
                              Icons.schedule,
                              color: Color(0xFFEF6920),
                              size: 16,
                              weight: 1.5,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              durationText,
                              style: AppTextStyles.subBody.copyWith(
                                color: Color(0xFFEF6920),
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 16),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imagePath,
                      height: 125,
                      width: 120,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              progress != null
                  ? Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Course Progress",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF121212),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            progressText!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF121212),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      LinearPercentIndicator(
                        padding: const EdgeInsets.all(0),
                        lineHeight: 6.0,
                        percent: progress!,
                        backgroundColor: Color(0xFFE4E4E4),
                        progressColor: Color(0xFFFFC803),
                        barRadius: const Radius.circular(8),
                      ),
                    ],
                  )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
