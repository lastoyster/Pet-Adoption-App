import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:pet_adoption_app/pages/home_page.dart';
import 'package:pet_adoption_app/pages/intro_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home for pets',
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(context),
      home: const IntroScreenPage(),
    );
  }

  ThemeData _buildThemeData(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      ),
    );
  }
}
