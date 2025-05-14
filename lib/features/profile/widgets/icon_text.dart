import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';

class IconAndText extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  const IconAndText({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 44,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFF1E232C), size: 20),
            const SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyles.body.copyWith(
                fontSize: 14,
                color: Color(0xFF121212),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
