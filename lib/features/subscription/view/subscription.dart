import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_revision/features/subscription/widgets/appbar.dart';
import 'package:flutter_revision/features/subscription/widgets/faq.dart';
import 'package:flutter_revision/features/subscription/widgets/fixed_bottom.dart';
import 'package:flutter_revision/features/subscription/widgets/how_trials_work.dart';
import 'package:flutter_revision/features/subscription/widgets/showcancelinfosheet.dart';
import 'package:flutter_revision/features/subscription/widgets/video_component.dart';
import 'package:flutter_revision/features/subscription/widgets/what_will_you_get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      bottomNavigationBar: const OfferBannerWithCountdown(
        duration: Duration(minutes: 30),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100.h,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                final top = constraints.biggest.height;
                final isCollapsed = top <= kToolbarHeight + 20;
                return FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.zero,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isCollapsed ? 1.0 : 0.0,
                    child: Text(
                      'UNLIMITED',
                      style: AppTextStyles.heading.copyWith(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  background: CustomAppBar(),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFFF3826), Color(0xFFFF9C0A)],
                      stops: [0.0, 1.0],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "UNLOCK ALL SPIRITUAL PROGRAMS",
                      style: AppTextStyles.title.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 10,
                  ),
                  child: const LoopingVideoPlayer(),
                ),
                Center(
                  child: Text(
                    "Try 7 days for",
                    style: AppTextStyles.title.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 36.sp,
                      color: const Color(0xFF121212),
                    ),
                  ),
                ),
                ShaderMask(
                  shaderCallback:
                      (bounds) => const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFFFF3426), Color(0xFFFF9C0A)],
                      ).createShader(bounds),
                  child: Text(
                    "₹7",
                    style: AppTextStyles.title.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 64.sp,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
                Text(
                  "Then ₹199/month",
                  style: AppTextStyles.title.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 18.sp,
                    color: const Color(0xFF121212),
                  ),
                ),
                GestureDetector(
                  onTap: () => showCancelInfoSheet(context),
                  child: Text(
                    "Cancel Anytime",
                    style: AppTextStyles.title.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 14.sp,
                      color: const Color(0xFF065FA8),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const WhatWillYouGet(),
                const SizedBox(height: 40),
                const HowTrialsWork(),
                const FaqSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
