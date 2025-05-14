import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_revision/features/home/view/play_audio.dart';

class MantraExplore extends StatelessWidget {
  MantraExplore({super.key});

  final List mantras = [
    {
      "title": "Lift Emotional Burden",
      "god": "Krishan Mantra",
      "durationText": "7 Mins",
      "imagePath": "assets/images/mantra_one.png",
    },
    {
      "title": "Find Your Inner Peace",
      "god": "Shiv Mantra",
      "durationText": "3 Mins",
      "imagePath": "assets/images/mantra_two.png",
    },
    {
      "title": "Overcome fears and anxiety",
      "god": "Ganesh Mantra",
      "durationText": "10 Mins",
      "imagePath": "assets/images/mantra_three.png",
    },
    {
      "title": "Build Unshakable Confidence",
      "god": "Hanuman Mantra",
      "durationText": "10 Mins",
      "imagePath": "assets/images/mantra_four.png",
    },
    {
      "title": "Lifelong Prosperity Mantra",
      "god": "Krishan Mantra",
      "durationText": "10 Mins",
      "imagePath": "assets/images/mantra_five.png",
    },
    {
      "title": "Overcome fears and anxiety",
      "god": "Krishan Mantra",
      "durationText": "10 Mins",
      "imagePath": "assets/images/mantra_six.png",
    },
    {
      "title": "Overcome fears and anxiety",
      "god": "Krishan Mantra",
      "durationText": "10 Mins",
      "imagePath": "assets/images/mantra_seven.png",
    },
    {
      "title": "Overcome fears and anxiety",
      "god": "Shiv Mantra",
      "durationText": "10 Mins",
      "imagePath": "assets/images/mantra_eight.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.668,
      ),
      itemCount: mantras.length,
      itemBuilder: (context, index) {
        final mantra = mantras[index];
        return GestureDetector(
          onTap: ()=>Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                  AudioPlayerScreen(imageUrl: mantra["imagePath"],),
            ),
          ),
          child: Card(
            color: Color(0xFFFFFFFF),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    mantra["imagePath"],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mantra["title"],
                        style: AppTextStyles.title.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              mantra["god"],
                              style: AppTextStyles.caption.copyWith(
                                fontSize: 12,
                                color: Color(0xFF5D6879),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            mantra["durationText"],
                            style: AppTextStyles.caption.copyWith(
                              fontSize: 12,
                              color: Color(0xFF5D6879),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
