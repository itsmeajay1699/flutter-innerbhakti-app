import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFDEAD), Color(0xFFFFF7EB)],
            ),
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'INNERBHAKTI',
                  style: AppTextStyles.heading.copyWith(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    height: 1.0,
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
                        'UNLIMITED',
                        style: AppTextStyles.heading.copyWith(
                          fontSize: 28.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          height: 0.9,
                        ),
                      ),
                    )
                    .animate() // 👈 Move .animate() here, outside ShaderMask
                    .fadeIn(duration: 600.ms)
                    .slideY(begin: 0.3)
                    .scale(
                      begin: const Offset(0.9, 0.9),
                      curve: Curves.easeOutBack,
                    ),
              ],
            ),
          ),
        ),
        Positioned(
          top: preferredSize.height * 0.6,
          left: MediaQuery.of(context).size.width * 0.25,
          child: Image.asset(
                'assets/images/star.png',
                width: 24.w,
                height: 24.h,
              )
              .animate(onPlay: (controller) => controller.repeat())
              .rotate(duration: 2.seconds, curve: Curves.linear),
        ),
        Positioned(
          top: preferredSize.height * 0.4,
          right: MediaQuery.of(context).size.width * 0.25,
          child: Image.asset(
                'assets/images/star.png',
                width: 24.w,
                height: 24.h,
              )
              .animate(onPlay: (controller) => controller.repeat())
              .rotate(duration: 2.seconds, curve: Curves.linear),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120.0);
}
