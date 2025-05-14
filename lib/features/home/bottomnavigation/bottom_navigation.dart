import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart'; // Make sure this package is added

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFFFFFFF),
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFFEF6920), // Orange for selected
      unselectedItemColor: const Color(0xFF121212),
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: HeroIcon(
            HeroIcons.home,
            style:
                currentIndex == 0 ? HeroIconStyle.solid : HeroIconStyle.outline,
            color:
                currentIndex == 0
                    ? const Color(0xFFEF6920)
                    : const Color(0xFF1E232C),
            size: 24,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: HeroIcon(
            HeroIcons.squares2x2,
            style:
                currentIndex == 1 ? HeroIconStyle.solid : HeroIconStyle.outline,
            color:
                currentIndex == 1
                    ? const Color(0xFFEF6920)
                    : const Color(0xFF1E232C),
            size: 24,
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: HeroIcon(
            HeroIcons.user,
            style:
                currentIndex == 2 ? HeroIconStyle.solid : HeroIconStyle.outline,
            color:
                currentIndex == 2
                    ? const Color(0xFFEF6920)
                    : const Color(0xFF1E232C),
            size: 24,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
