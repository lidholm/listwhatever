import 'package:flutter/material.dart';

const mainColor = Color.fromARGB(255, 239, 109, 0);
const shadedMainColor = Color.fromARGB(255, 255, 204, 128);
const mainColorBorder = Color.fromARGB(255, 249, 171, 37);
const shadedTextColor = Color.fromARGB(255, 158, 158, 158);
const backgroundColor = Color.fromARGB(255, 220, 237, 255);
const primaryButtonColor = Color.fromARGB(255, 135, 0, 88);
const secondaryButtonColor = Color.fromARGB(255, 43, 89, 195);
const errorsColor = Colors.red;
const textColor = Color.fromARGB(255, 0, 7, 45);

final commonThemeData = ThemeData(
  splashColor: mainColor,
  // Define the default brightness and colors.
  // brightness: Brightness.dark,
  primaryColor: primaryButtonColor,
  appBarTheme: const AppBarTheme(color: mainColor),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: shadedTextColor, fontSize: 16),
    floatingLabelStyle: TextStyle(color: textColor, fontSize: 16),
    hintStyle: TextStyle(color: shadedTextColor, fontSize: 16),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: mainColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: mainColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: mainColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: errorsColor,
        width: 2,
      ),
    ),
    errorStyle: TextStyle(height: 0.7),
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.white),
    fillColor: MaterialStateProperty.all(mainColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: mainColor,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
    ),
  ),
);
