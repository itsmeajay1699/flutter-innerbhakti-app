// main_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_revision/features/track/data/index.dart';
import 'package:flutter_revision/features/track/widgets/expansion_tile.dart';

class CourseProgressScreen extends StatelessWidget {
  final List<dynamic> sections =
      TrackDataSource.trackData['sections'] as List<dynamic>;

  CourseProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/big_shiv.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 24,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFDF0E9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "Most Popular",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFEF6920),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Shiv Nidra Program",
                    style: AppTextStyles.body.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF121212),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "If stress, anxiety, overthinking, or emotional heaviness are disturbing your sleep....read more",
                    style: AppTextStyles.body.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF5D6879),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.asset(
                    'assets/images/track.png',
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 34,
                  ),
                  const SizedBox(height: 30),
                  ...sections.asMap().entries.map((entry) {
                    final index = entry.key;
                    final section = entry.value;
                    return SectionWidget(
                      title: 'Understanding Shivji’s presence',
                      status: section['status'],
                      index: index,
                      days: List<Map<String, dynamic>>.from(section['days']),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
