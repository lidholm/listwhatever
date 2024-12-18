import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListWhateverTheme {
  ListWhateverTheme(this.context);
  final BuildContext context;

  ThemeData getThemeData() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: GoogleFonts.merriweather(),
        displaySmall: GoogleFonts.pacifico(),
        titleLarge: GoogleFonts.oswald(
          fontSize: 20,
        ),
        titleMedium: GoogleFonts.inter(),
        titleSmall: GoogleFonts.inter(),
      ),
      useMaterial3: true,
    );
  }
}
