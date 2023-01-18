import 'package:flutter/material.dart';
import 'package:todo/shared/stayls/colours.dart';

class MyTHemeData{

  static const Color colorwhit= Colors.white;

  static ThemeData lightTheme=ThemeData(
    primaryColor: primarydark,
    scaffoldBackgroundColor: greenBackground,

    colorScheme: ColorScheme(
        brightness:Brightness.light ,
        primary: praimary_colour,
        onPrimary: colorwhit,
        secondary: green_colour,
        onSecondary: colorwhit,
        error: Colors.red,
        onError: colorwhit,
        background: greenBackground,
        onBackground: black_colour,
        surface: Colors.grey,
        onSurface: colorwhit,
      ),

      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: white_colour)
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: white_colour,
      selectedItemColor: praimary_colour,
      unselectedItemColor: Colors.grey,
    ),
      textTheme: const TextTheme(
      headline1: TextStyle(
      fontSize: 30,
        fontWeight: FontWeight.bold,
        color: white_colour,
  ),
        subtitle1: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: praimary_colour
        ),
          subtitle2: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color:green_colour
      )
  ),

  );

  static ThemeData darkTheme=ThemeData(
    primaryColor: praimary_colour,
    scaffoldBackgroundColor: greenBackground,

    colorScheme: ColorScheme(
      brightness:Brightness.light ,
      primary: praimary_colour,
      onPrimary: colorwhit,
      secondary: green_colour,
      onSecondary: colorwhit,
      error: Colors.red,
      onError: colorwhit,
      background: greenBackground,
      onBackground: black_colour,
      surface: Colors.grey,
      onSurface: colorwhit,
    ),

    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: white_colour)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: white_colour,
      selectedItemColor: praimary_colour,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: white_colour,
        ),
        subtitle1: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: praimary_colour
        ),
        subtitle2: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color:green_colour
        )
    ),

  );

}