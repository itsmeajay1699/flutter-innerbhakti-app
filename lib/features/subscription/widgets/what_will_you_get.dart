import 'package:flutter/material.dart';

class WhatWillYouGet extends StatelessWidget {
  const WhatWillYouGet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "What will you get?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF121212),
                ),
              ),
            ),
            SizedBox(height: 30),
            GetRow(
              imagePath: 'assets/images/one.png',
              title: 'Unlock Unlimited Programs',
              subtitle: 'Get access to 100+ spiritual programs',
            ),
            const SizedBox(height: 12), // space before line
            Container(
              height: 1.5,
              width: double.infinity,
              color: const Color(0xFFFFE7C3),
            ),
            const SizedBox(height: 20), // space after line
            GetRow(
              imagePath: 'assets/images/two.png',
              title: 'AI Powered Daily Prayers',
              subtitle: 'Pray to achieve personal goals',
            ),
            const SizedBox(height: 20),
            Container(
              height: 1.5,
              width: double.infinity,
              color: const Color(0xFFFFE7C3),
            ),
            const SizedBox(height: 12),
            GetRow(
              imagePath: 'assets/images/three.png',
              title: '100+ Divine Sounds',
              subtitle: 'Meditate using powerful mantras and chants',
            ),
          ],
        ),
      ),
    );
  }
}

class GetRow extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const GetRow({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imagePath, width: 42, height: 42),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF121212),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF121212),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
