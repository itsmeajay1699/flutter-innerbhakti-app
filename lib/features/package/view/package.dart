import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_revision/features/package/widgets/comparison_table.dart';
import 'package:flutter_revision/features/package/widgets/plancard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7EB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 190,
            backgroundColor: Colors.red.shade50,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFFDEAD), Color(0xFFFFF7EB)],
                  stops: [0.0, 1.0],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Stack(
                  children: [
                    Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SingleChildScrollView( // 👈 important to avoid overflow when collapsing
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) => const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Color(0xFFFF3426), Color(0xFFFF9C0A)],
                                  ).createShader(bounds),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Membership\n Plans',
                                    style: AppTextStyles.heading.copyWith(
                                      fontSize: 32.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      height: 0.9,
                                    ),
                                  ),
                                )
                                    .animate()
                                    .fadeIn(duration: 600.ms)
                                    .slideY(begin: 0.3)
                                    .scale(
                                  begin: const Offset(0.9, 0.9),
                                  curve: Curves.easeOutBack,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  textAlign: TextAlign.center,
                                  "Choose Your Preferred Plan Below",
                                  style: AppTextStyles.title.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19.sp,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                FittedBox(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFE2B8),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Yearly Access For All Plans",
                                        style: AppTextStyles.caption.copyWith(
                                          fontSize: 16.sp,
                                          color: Color(0xFFA36100),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 80 * 0.65,
                      left: MediaQuery.of(context).size.width * 0.25,
                      child: Image.asset(
                        'assets/images/star.png',
                        width: 32.w,
                        height: 32.h,
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .rotate(duration: 2.seconds, curve: Curves.linear),
                    ),
                    Positioned(
                      top: 10 * 0.39,
                      right: MediaQuery.of(context).size.width * 0.16,
                      child: Image.asset(
                        'assets/images/star.png',
                        width: 32.w,
                        height: 32.h,
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .rotate(duration: 2.seconds, curve: Curves.linear),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                height: 220, // Set this to match your card height
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: plans.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 12), // spacing between cards
                      child: buildPlanCard(
                        plans[index],
                        isHighlighted: index == 0,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FeatureComparisonTable(),
          )
        ],
      ),
    );
  }
}
