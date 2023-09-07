import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimaryColor,
    dividerColor: Colors.black,
    canvasColor: Colors.white,
    cardColor: Colors.black,
    appBarTheme: AppBarTheme(
      actionsIconTheme: const IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      centerTitle: false,
      backgroundColor: AppColors.lightPrimaryColor,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

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

      // all the grey texts
      displayLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.grey[400],
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
  static ThemeData darkTheme = ThemeData(
    dividerColor: AppColors.lightPrimaryColor,
    primaryColor: AppColors.lightPrimaryColor,
    canvasColor: const Color(
      0XFF141922,
    ),
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      actionsIconTheme: const IconThemeData(
        color: Colors.black,
        size: 30,
      ),
      centerTitle: false,
      backgroundColor: AppColors.lightPrimaryColor,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),

    // task item widget clock font
    textTheme: TextTheme(
      bodySmall: GoogleFonts.roboto(
        fontSize: 12,
        color: Colors.white,
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

      // all the grey texts
      displayLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.grey[400],
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Color(
        0XFF141922,
      ),
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
    scaffoldBackgroundColor: AppColors.darkPrimaryColor,
  );
}
