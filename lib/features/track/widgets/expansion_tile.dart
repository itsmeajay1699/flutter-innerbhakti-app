// section_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_revision/features/home/view/play_audio.dart';
import 'package:heroicons/heroicons.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final String status;
  final int index;
  final List<Map<String, dynamic>> days;

  const SectionWidget({
    super.key,
    required this.title,
    required this.status,
    required this.days,
    required this.index,
  });

  Color getStatusColor(String status) {
    switch (status) {
      case 'done':
        return Color(0xFFE6F6EE);
      case 'in-progress':
        return Color(0xFFFFFAE6);
      default:
        return Colors.grey.shade300;
    }
  }

  String getStatusLabel(String status) {
    switch (status) {
      case 'done':
        return 'Done';
      case 'in-progress':
        return 'In Progress';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Section ${index + 1}',
                  style: AppTextStyles.body.copyWith(
                    color: const Color(0xFF5D6879),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                if (status != 'not-started')
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: getStatusColor(status),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      getStatusLabel(status),
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color:
                            status == 'done'
                                ? const Color(0xFF09A452)
                                : const Color(0xFFEF6920),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: AppTextStyles.body.copyWith(
                color: const Color(0xFF121212),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        children:
            days.map((day) {
              final isCompleted = day['isCompleted'] ?? false;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                          AudioPlayerScreen(
                            audioUrl: day["audioUrl"],
                          ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    title: Text(
                      'Day ${day['dayNumber']}',
                      style: AppTextStyles.title.copyWith(
                        color: const Color(0xFFEF6920),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      day['content'],
                      style: AppTextStyles.body.copyWith(
                        color: const Color(0xFF121212),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            isCompleted
                                ? const Color(0xFF09A452)
                                : const Color(0xFFEF6920),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: HeroIcon(
                        isCompleted ? HeroIcons.check : HeroIcons.play,
                        style: HeroIconStyle.solid,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
