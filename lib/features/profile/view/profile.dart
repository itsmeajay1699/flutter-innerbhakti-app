import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_revision/features/profile/widgets/icon_text.dart';
import 'package:flutter_revision/features/profile/widgets/profile_info.dart';
import 'package:flutter_revision/features/profile/widgets/show_dialoge.dart';
import 'package:heroicons/heroicons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: 200,
                    color: Color(0xFFFFFAE6),
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Profile Details',
                      style: AppTextStyles.title.copyWith(
                        fontSize: 16,
                        color: const Color(0xFF121212),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/shiv_nidra.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            Text(
              'Shivam Singh',
              style: AppTextStyles.title.copyWith(
                fontSize: 20,
                color: const Color(0xFF121212),
              ),
            ),
            Text(
              'Joined in 2013',
              style: AppTextStyles.title.copyWith(
                fontSize: 14,
                color: const Color(0xFF5D6879),
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ProfileItem(title: 'Age', value: '18–24'),
                    const Divider(color: Color(0xFFE4E4E4)),
                    ProfileItem(title: 'Phone Number', value: '+91123456789'),
                    const Divider(color: Color(0xFFE4E4E4)),
                    ProfileItem(title: 'Gender', value: 'Male'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  IconAndText(title: "Edit Profile", icon: Icons.edit),
                  const SizedBox(height: 8),
                  IconAndText(title: "Rate App", icon: Icons.star),
                  const SizedBox(height: 8),
                  IconAndText(
                    title: "Logout",
                    icon: Icons.logout,
                    onTap: () async {
                      await showDialoge(
                        context,
                        'Logout',
                        'Are you sure you want to logout?',
                        HeroIcons.exclamationTriangle,
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Delete Account
            GestureDetector(
              onTap: () async {
                final result = await showDialoge(
                  context,
                  'Delete Account',
                  'Are you sure you want to delete your account?',
                  HeroIcons.exclamationTriangle,
                );
                if (result == true) {}
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  children: [
                    HeroIcon(
                      HeroIcons.xCircle,
                      color: const Color(0xFFE64331),
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Delete Account',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 15,
                        color: const Color(0xFFE64331),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 50,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
