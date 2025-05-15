import 'package:flutter/material.dart';
import 'package:flutter_revision/core/shared_preference/shared_preferences_service.dart';
import 'package:flutter_revision/utils/go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Innner Bhakti',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            useMaterial3: true,
          ),
          routerConfig: router,
        );
      },
    );
  }
}
