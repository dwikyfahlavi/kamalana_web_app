import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kamalana_web_app/screens/home_screen.dart'; // Import if using Google Fonts

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kamalana Atelier',
      theme: ThemeData(
        // Refined color palette
        primarySwatch: Colors.blueGrey,
        primaryColor: const Color(0xFF023131), // A deep indigo blue
        hintColor:
            const Color.fromARGB(255, 0, 0, 0), // A vibrant amber for accents
        scaffoldBackgroundColor:
            const Color(0xFF023131), // Light grey background

        // Use Google Fonts or define a custom text theme
        textTheme: GoogleFonts.montserratTextTheme(
          // Example with Montserrat from Google Fonts
          Theme.of(context).textTheme.copyWith(
                headlineLarge: TextStyle(
                    color: Color(0xFF023131), fontWeight: FontWeight.bold),
                headlineMedium: TextStyle(
                    color: Colors.blueGrey[800], fontWeight: FontWeight.w600),
                bodyLarge: TextStyle(color: Colors.grey[800]),
                bodyMedium: TextStyle(color: Colors.grey[700]),
              ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF023131), // Dark Blue Grey
          foregroundColor: Colors.white,
          elevation: 4,
          titleTextStyle: GoogleFonts.ysabeau(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color.fromARGB(255, 2, 49, 49), // Deep indigo
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: GoogleFonts.ysabeau(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadowColor: Colors.black.withOpacity(0.1),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
