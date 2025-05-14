import 'package:flutter/material.dart';
import 'package:flutter_revision/core/theme/app_text_styles.dart';
import 'package:flutter_revision/features/subscription/widgets/faqtile.dart';
import 'package:flutter_revision/features/subscription/widgets/showcancelinfosheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        "q": "What is InnerBhakti Unlimited?",
        "a": "It gives you unlimited access to all programs in the app.",
      },
      {
        "q": "What is the trial plan?",
        "a":
            "Start for ₹7 and explore everything. Cancel within 7 days for full refund.",
      },
      {
        "q": "How long is the InnerBhakti Unlimited subscription?",
        "a": "It's a monthly plan that renews every 30 days.",
      },
      {
        "q": "When will the next payment happen?",
        "a": "On the 8th day after your trial starts, and then every month.",
      },
      {
        "q": "How much does InnerBhakti Unlimited cost?",
        "a": "After the trial, it's ₹199 per month.",
      },
      {
        "q": "How can I pay for InnerBhakti Unlimited?",
        "a": "Using UPI AutoPay, credit/debit cards, or wallets via Razorpay.",
      },
      {
        "q": "Why should I choose InnerBhakti over other programs?",
        "a":
            "It's devotion-led, personalized, and spiritually rooted — not generic meditation.",
      },
      {
        "q": "Can I cancel my InnerBhakti subscription anytime?",
        "a": "Yes. Go to Account Settings → Cancel Subscription.",
      },
      {
        "q": "What should I do if I face issue with my subscription?",
        "a": "Reach out to us via WhatsApp or support inside the app.",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => showCancelInfoSheet(context),
            child: Text(
              "How to Cancel?",
              style: AppTextStyles.title.copyWith(
                fontWeight: FontWeight.w800,
                color: Color(0xFF525252),
                fontSize: 14.sp,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: const Text(
              textAlign: TextAlign.center,
              "Frequently Asked \n Question",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF121212),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: faqs.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return FaqTile(
                    question: faqs[index]["q"]!,
                    answer: faqs[index]["a"]!,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
