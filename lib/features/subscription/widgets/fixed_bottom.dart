import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_revision/features/onboarding/view/first.dart';
import 'package:flutter_revision/features/subscription/controller/subscription_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class OfferBannerWithCountdown extends StatefulWidget {
  final Duration duration;

  const OfferBannerWithCountdown({super.key, required this.duration});

  @override
  State<OfferBannerWithCountdown> createState() =>
      _OfferBannerWithCountdownState();
}

class _OfferBannerWithCountdownState extends State<OfferBannerWithCountdown> {
  late Duration _remaining;
  Timer? _timer;
  Razorpay razorpay = Razorpay();

  final PaymentController _controller = PaymentController();
  bool _isLoading = false;

  void _startPaymentFlow() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await _controller.createOrder();

      if (_controller.orderResponse != null) {
        final orderId = _controller.orderResponse!['order_id'];

        // Then launch Razorpay checkout

        var options = {
          'key': 'rzp_test_hSpk2hCp8AIBCo',
          'amount': 499,
          'name': 'InnerBhakti',
          'order_id': orderId,
          'prefill': {'contact': '8700499943', 'email': 'test@example.com'},
        };
        razorpay.open(options);
      }
    } catch (e) {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _remaining = widget.duration;
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining.inSeconds <= 1) {
        timer.cancel();
      } else {
        setState(() {
          _remaining = _remaining - const Duration(seconds: 1);
        });
      }
    });
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final h = twoDigits(d.inHours);
    final m = twoDigits(d.inMinutes.remainder(60));
    final s = twoDigits(d.inSeconds.remainder(60));
    return "$h:$m:$s";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Try for 7 days, cancel anytime",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF121212),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/first');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isLoading
                            ? const Color(0xFFEF6920).withOpacity(0.1)
                            : const Color(0xFFEF6920),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 30,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "₹7",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Start Trial",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: GestureDetector(
            onTap: () {
              context.go('/first');
            },
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE4E4E4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.hourglass_bottom, size: 16),
                    const SizedBox(width: 6),
                    const Text(
                      "Offer ends in ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      _formatDuration(_remaining),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
