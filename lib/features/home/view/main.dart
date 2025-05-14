import 'package:flutter/material.dart';
import 'package:flutter_revision/features/explore/view/explore.dart';
import 'package:flutter_revision/features/home/bottomnavigation/bottom_navigation.dart';
import 'package:flutter_revision/features/home/view/home.dart';
import 'package:flutter_revision/features/profile/view/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [MainScreen(), ExplorePage(), ProfileScreen()],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _controller.jumpToPage(index);
        },
      ),
    );
  }
}
