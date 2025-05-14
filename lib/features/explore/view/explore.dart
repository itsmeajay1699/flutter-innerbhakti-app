import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_revision/features/explore/widgets/explore_mantra.dart';
import 'package:flutter_revision/features/explore/widgets/explore_program_card.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List programs = [
      {
        "title": "Shiv Nidra Program",
        "subtitle": "Embrace restful nights and deep sleep",
        "durationText": "14 Days",
        "progress": 0.35,
        "progressText": "35%",
        "imagePath": "assets/images/shiv_nidra.png",
      },
      {
        "title": "Shiv Sneh Program",
        "subtitle": "Heal and Strengthen your Relationships",
        "durationText": "14 Days",
        "progress": 0.08,
        "progressText": "8%",
        "imagePath": "assets/images/shiv_sneh.png",
      },
      {
        "title": "Shiv MahaNidra Program",
        "subtitle": "Advance relaxation and divine healing",
        "durationText": "14 Days",
        "imagePath": "assets/images/shiv_maha.png",
      },
      {
        "title": "Shiv Shanti Program",
        "subtitle": "Calm your mind and find inner peace",
        "durationText": "14 Days",
        "imagePath": "assets/images/shiv_shanti.png",
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 15),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Spiritual Programs',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ...programs.map((program) {
                return ShivNidraCard(
                  title: program["title"],
                  subtitle: program["subtitle"],
                  durationText: program["durationText"],
                  progress: program["progress"],
                  progressText: program["progressText"],
                  imagePath: program["imagePath"],
                );
              }),
              const SizedBox(height: 20),
              Text(
                'Mantra Meditation',
                style: AppTextStyles.body.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              MantraExplore(),
            ],
          ),
        ),
      ),
    );
  }
}
