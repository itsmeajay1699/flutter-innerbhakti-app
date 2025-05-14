import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../../core/theme/app_text_styles.dart';

class SinglePrayerScreen extends StatelessWidget {
  const SinglePrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black26,
            ),
            child: HeroIcon(
              HeroIcons.arrowLeft,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        title: Text(
          "Prayer of the day",
          style: AppTextStyles.title.copyWith(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          top: MediaQuery.of(context).padding.top + kToolbarHeight + 20, // adjust for status bar + appbar
          bottom: 120,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/prayer.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Text(
              textAlign: TextAlign.center,
              "Hanuman, Bless Me with resilience to face adversities and emerge stronger.",
              style: AppTextStyles.body.copyWith(
                color: Color(0xFFFFDA56),
                fontWeight: FontWeight.w800,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black26,
                  ),
                  child: HeroIcon(
                    HeroIcons.share,
                    style: HeroIconStyle.outline,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black26,
                  ),
                  child: HeroIcon(
                    HeroIcons.heart,
                    style: HeroIconStyle.outline,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
