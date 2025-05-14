import 'package:flutter/material.dart';

class HowTrialsWork extends StatelessWidget {
  const HowTrialsWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "How does the trial work?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF121212),
              ),
            ),
          ),
          SizedBox(height: 40),
          TrialStepTile(
            icon: Icons.lock,
            iconBgColor: Color(0xFFFF6D2D),
            title: "Today",
            subtitle: "Unlock all program at ₹7",
            badgeText: "Trial Starts",
            badgeColor: Color(0xFFEAF9E7),
            badgeTextColor: Color(0xFF218C04),
          ),
          TrialStepTile(
            icon: Icons.notifications_active,
            iconBgColor: Color(0xFFFF6D2D),
            title: "In 7 days",
            subtitle: "Cancel anytime and get full refund",
          ),
          TrialStepTile(
            icon: Icons.emoji_events,
            iconBgColor: Color(0xFFFF6D2D),
            title: "On 8th day",
            subtitle: "Your plan will auto renew for ₹199 every month",
            badgeText: "Monthly Plan Starts",
            badgeColor: Color(0xFFFDE9DE),
            badgeTextColor: Color(0xFFEF6920),
            showLineBelow: false,
          ),
        ],
      ),
    );
  }
}

class TrialStepTile extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final String? badgeText;
  final Color? badgeColor;
  final bool showLineBelow;
  final Color? badgeTextColor;

  const TrialStepTile({
    super.key,
    required this.icon,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    this.badgeText,
    this.badgeColor,
    this.showLineBelow = true,
    this.badgeTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            if (showLineBelow)
              Container(width: 9, height: 50, color: const Color(0xFFFDCF9E)),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0xFF121212),
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (badgeText != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: badgeColor ?? Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        badgeText!,
                        style: TextStyle(
                          color: badgeTextColor ?? Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 16, color: Color(0xFF7A7A7A)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
