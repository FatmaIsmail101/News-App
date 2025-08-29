import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_pallete.dart';

abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorPallete.textDark,
    scaffoldBackgroundColor: ColorPallete.backgroundLight,
    textTheme: GoogleFonts.interTextTheme().copyWith(
      bodySmall: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
        color: ColorPallete.textDark,
      ),
      bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        color: ColorPallete.textDark,
      ),
      bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
        color: ColorPallete.textDark,
      ),
      headlineSmall: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        color: ColorPallete.textDark,
      ),
      titleLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
        color: ColorPallete.textDark,
      ),
    ),
    hintColor: ColorPallete.backgroundLight,
    highlightColor: ColorPallete.backgroundLight,
    drawerTheme: DrawerThemeData(backgroundColor: ColorPallete.backgroundLight),
    appBarTheme: AppBarTheme(
      foregroundColor: ColorPallete.backgroundLight,
      iconTheme: IconThemeData(color: ColorPallete.backgroundLight),

      backgroundColor: ColorPallete.backgroundLight,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorPallete.backgroundLight,
      selectedIconTheme: IconThemeData(color: ColorPallete.backgroundLight),
      selectedItemColor: ColorPallete.backgroundLight,
      selectedLabelStyle: TextStyle(
        color: ColorPallete.backgroundLight,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      unselectedIconTheme: IconThemeData(color: ColorPallete.textDark),
      unselectedLabelStyle: TextStyle(
        color: ColorPallete.textDark,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      unselectedItemColor: ColorPallete.textDark,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    drawerTheme: DrawerThemeData(backgroundColor: ColorPallete.backgroundDark),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorPallete.backgroundDark,
      selectedIconTheme: IconThemeData(color: ColorPallete.backgroundDark),
      selectedItemColor: ColorPallete.backgroundDark,
      selectedLabelStyle: TextStyle(
        color: ColorPallete.backgroundDark,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      unselectedIconTheme: IconThemeData(color: ColorPallete.textDark),
      unselectedLabelStyle: TextStyle(
        color: ColorPallete.textDark,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      unselectedItemColor: ColorPallete.textDark,
    ),
    iconTheme: IconThemeData(color: ColorPallete.backgroundDark),
    primaryColor: ColorPallete.backgroundLight,
    scaffoldBackgroundColor: ColorPallete.backgroundDark,
    textTheme: GoogleFonts.interTextTheme().copyWith(
      bodySmall: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: ColorPallete.textDark,
      ),
      bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: ColorPallete.textDark,
      ),
      bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: ColorPallete.textDark,
      ),
      headlineSmall: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: ColorPallete.textDark,
      ),
    ),
    hintColor: ColorPallete.backgroundLight,
    highlightColor: ColorPallete.backgroundLight,
    appBarTheme: AppBarTheme(
      foregroundColor: ColorPallete.backgroundDark,
      backgroundColor: ColorPallete.backgroundDark,
    ),
  );
}
