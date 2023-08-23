import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimaryColor,
    canvasColor: Colors.white,
    cardColor: Colors.black,
    appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColors.lightPrimaryColor,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        )),

    // task item widget clock font
    textTheme: TextTheme(
      bodySmall: GoogleFonts.roboto(
        fontSize: 12,
        color: Colors.black,
      ),
      // settings items font
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        color: AppColors.lightPrimaryColor,
      ),

      // task item widget title font
      bodyLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.lightPrimaryColor,
      ),

      displayLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      // displaySmall: ,
      // displayMedium: ,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedIconTheme: IconThemeData(
        color: AppColors.lightPrimaryColor,
        size: 34,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(
          0XFFC8C9CB,
        ),
        size: 30,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
    ),
    scaffoldBackgroundColor: AppColors.lightBackGroundColor,
  );
}
