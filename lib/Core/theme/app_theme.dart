import 'package:animal_app/Core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
    buttonTheme: ButtonThemeData(
      
    ),
    scaffoldBackgroundColor: AppColor.whiteColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      bodyLarge: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
