import 'package:flutter/material.dart';

class FeatureComparisonTable extends StatelessWidget {
  const FeatureComparisonTable({super.key});

  final List<String> features = const [
    'Shiv Nidra Program (Rs. 1000)',
    'Do it anywhere',
    'Habit tracking',
    'Priority support',
    'AI Powered Daily prayers app',
    'Level II Shiv MahaNidra Program (Rs. 3500)',
    'One 1x1 sleep consultations*',
    'Shiv Sneh Program (Rs. 1000)',
    'Shiv Shanti Program (Rs. 1000)',
    '1 New program Per Month',
    'Shivji Mantra Meditations',
  ];

  final List<List<bool>> availability = const [
    [true, true, true],
    [true, true, true],
    [true, true, false],
    [true, true, true],
    [true, true, false],
    [true, true, false],
    [true, true, false],
    [true, false, false],
    [true, false, false],
    [false, false, false],
    [false, false, false],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Header Row
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0D9), // Light orange background
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: const [
                Expanded(flex: 2, child: SizedBox()), // Empty for first column
                Expanded(child: Center(child: FittedBox(child: Text('Transform', style: TextStyle(fontWeight: FontWeight.bold))))),
                Expanded(child: Center(child: Text('Heal', style: TextStyle(fontWeight: FontWeight.bold)))),
                Expanded(child: Center(child: Text('Sleep', style: TextStyle(fontWeight: FontWeight.bold)))),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Data Rows
          ...List.generate(features.length, (index) {
            final feature = features[index];
            final status = availability[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      feature,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  ...status.map((available) => Expanded(
                    child: Center(
                      child: Icon(
                        available ? Icons.check_circle : Icons.cancel,
                        color: available ? Colors.green : Colors.red,
                        size: 20,
                      ),
                    ),
                  )),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
