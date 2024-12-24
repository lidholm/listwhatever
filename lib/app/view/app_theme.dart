import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListWhateverTheme {
  ListWhateverTheme(this.context);
  final BuildContext context;

  ThemeData getThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.grey.shade900,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade900,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.amber.shade400,
        foregroundColor: Colors.black,
      ),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
        ),
        // bodyMedium: GoogleFonts.merriweather(),
        // displaySmall: GoogleFonts.pacifico(),
        // titleLarge: GoogleFonts.oswald(
        //   fontSize: 20,
        // ),
        // titleMedium: GoogleFonts.inter(),
        // titleSmall: GoogleFonts.inter(),
      ),
    );
  }
}
