import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:heroicons/heroicons.dart';

Future<bool> showDialoge(
  BuildContext context,
  String title,
  String content,
  HeroIcons icon,
) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Column(
          children: [
            HeroIcon(icon, color: const Color(0xFFE64331), size: 35),
            Text(
              title,
              style: AppTextStyles.title.copyWith(
                color: Color(0xFF121212),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              content,
              style: AppTextStyles.title.copyWith(
                color: Color(0xFF121212),
                fontWeight: FontWeight.w700,
                height: 1.2,
                fontSize: 16,
              ),
            ),
          ],
        ),

        actions: [
          Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE64331),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'OK',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14,
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Color(0xFFE64331)),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Cancel',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14,
                        color: const Color(0xFFE64331),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
