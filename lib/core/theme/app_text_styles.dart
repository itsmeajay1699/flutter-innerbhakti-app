import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final heading = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static final title = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  static final body = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static final subBody = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static final caption = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
}
