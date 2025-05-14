import 'package:flutter/material.dart';

class FaqTile extends StatelessWidget {
  final String question;
  final String answer;

  const FaqTile({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        collapsedBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xFF121212),
          ),
        ),
        children: [
          Text(
            answer,
            style: const TextStyle(fontSize: 14, color: Color(0xFF525252)),
          ),
        ],
      ),
    );
  }
}
