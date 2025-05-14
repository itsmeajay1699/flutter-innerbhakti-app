import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/plan.dart';

final List<Plan> plans = [
  Plan(
    title: "Transform",
    subtitle: "Unlimited Programs",
    originalPrice: 12500,
    discountedPrice: 2499,
    discountPercent: 80,
  ),
  Plan(
    title: "Heal",
    subtitle: "2 Programs",
    originalPrice: 4500,
    discountedPrice: 1499,
    discountPercent: 67,
  ),
  Plan(
    title: "Sleep",
    subtitle: "1 Program",
    originalPrice: 1000,
    discountedPrice: 499,
    discountPercent: 50,
  ),
];

Widget buildPlanCard(Plan plan, {bool isHighlighted = false}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 193,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: isHighlighted
                ? Border.all(
              color: Color(0xFF139632),
              width: 2,
            )
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF121212),
                  ),
                ),
                Text(
                  plan.subtitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "₹${plan.originalPrice}/-",
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                    color: Color(0xFF545454),
                  ),
                ),
                Text(
                  "₹${plan.discountedPrice}/-",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF121212),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEF6920),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Badge Outside Card
        Positioned(
          top: -8, // Negative to push outside
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              "${plan.discountPercent}% OFF",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
