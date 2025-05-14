import 'package:flutter_revision/core/shared_preference/shared_preferences_service.dart';
import 'package:flutter_revision/features/auth/login/view/login_screen.dart';
import 'package:flutter_revision/features/auth/verify_otp/verify_otp.dart';
import 'package:flutter_revision/features/home/view/main.dart';
import 'package:flutter_revision/features/onboarding/view/first.dart';
import 'package:flutter_revision/features/onboarding/view/second.dart';
import 'package:flutter_revision/features/onboarding/view/third.dart';
import 'package:flutter_revision/features/splash/view/version_first.dart';
import 'package:flutter_revision/features/subscription/view/subscription.dart';
import 'package:flutter_revision/service/auth/auth_service.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/otp', builder: (context, state) => const OTPScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/first', builder: (context, state) => const FirstScreen()),
    GoRoute(path: '/second', builder: (context, state) => const SecondPage()),
    GoRoute(path: '/third', builder: (context, state) => const ThirdScreen()),
    GoRoute(
      path: "/subscription",
      builder: (context, state) => const SubscriptionPage(),
    ),
  ],
);
