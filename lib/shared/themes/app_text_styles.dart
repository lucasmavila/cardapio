import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cardap/shared/themes/app_colors.dart';

class AppTextStyles {
  static final bigTitle = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.body,
  );
  static final mediumTitle = GoogleFonts.poppins(
    fontSize: 23,
    fontWeight: FontWeight.w600,
    color: AppColors.body,
  );
  static final smallTitle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.body,
  );
  static final buttonWhite = GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.background);
  static final body = GoogleFonts.lexendDeca(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.body);
  static final placeholder = GoogleFonts.lexendDeca(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.stroke);

  static final description = GoogleFonts.lexendDeca(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.stroke);
  static final price = GoogleFonts.lexendDeca(
      fontSize: 24, fontWeight: FontWeight.w500, color: Colors.green);
  static final littlePrice = GoogleFonts.lexendDeca(
      fontSize: 14, fontWeight: FontWeight.w500, color: Colors.green);
}
