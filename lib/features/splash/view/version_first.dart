import 'package:flutter/material.dart';
import 'package:flutter_revision/service/auth/auth_service.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: AuthService.isLoggedIn(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final isLoggedIn = snapshot.data!;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.go(isLoggedIn ? '/home' : '/login');
        });

        return const SizedBox.shrink();
      },
    );
  }
}
