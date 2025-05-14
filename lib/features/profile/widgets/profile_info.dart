import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;

  const ProfileItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w500,
              color: Color(0xFF5D6879),
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w500,
              color: Color(0xFF121212),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
