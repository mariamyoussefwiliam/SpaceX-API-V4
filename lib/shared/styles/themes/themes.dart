import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mega_trust_task/shared/styles/colors.dart';

ThemeData lightTheme(context) {
  return ThemeData(
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        elevation: 30
    ),
    textTheme: GoogleFonts.nunitoTextTheme(
      Theme.of(context).textTheme,
    ).apply(bodyColor: Colors.black54,) ,
    primarySwatch: color,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(

      backgroundColor: Colors.white,
      toolbarHeight: 60,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,

      ),
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
      titleTextStyle: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: Colors.black54,
        fontSize: 20,
        fontWeight: FontWeight.bold,

      ),
      elevation: 0,
    ),
  );
}
