import 'package:flutter/material.dart';

// REMOVED: import 'package:google_fonts/google_fonts.dart'; 
// We are now 100% local to bypass the China firewall.

class MBricsTheme {
  // Continuity Palette
  static const Color goldBase = Color(0xFFC2994B);
  static const Color terminalBlack = Color(0xFF121212);
  static const Color silver = Color(0xFFA7A9AC);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF8F9FA);
  static const Color terminalGreen = Color(0xFF2E7D32);

  // Continuity Invariants
  static const double featureIconSize = 80.0;

  // Branded Greeting Logic
  static String getBrandGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 17 || hour < 4) return "Good evening";
    if (hour < 12) return "Good morning";
    return "Good afternoon";
  }

  // Institutional Card Decoration
  static BoxDecoration pillarCardDecoration = BoxDecoration(
    color: pureWhite,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.03),
        blurRadius: 15,
        offset: const Offset(0, 8),
      ),
    ],
    border: Border.all(color: Colors.black.withOpacity(0.05)),
  );

  // --- LOCAL TYPOGRAPHY SYSTEM ---

  // Default Inter Style (For Hero Text/Titles)
  static const TextStyle headingStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  // Default Body Style
  static const TextStyle bodyStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
    color: silver,
  );

  // Terminal Mono Style for Engine Text
  static const TextStyle monoStyle = TextStyle(
    fontFamily: 'ShareTechMono', // Matches pubspec family name
    color: terminalGreen,
    fontSize: 11,
    fontWeight: FontWeight.bold,
  );

  // Global Theme Data to apply to the whole App
  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: goldBase,
      scaffoldBackgroundColor: terminalBlack,
      // Setting 'Inter' as the default for the entire application
      fontFamily: 'Inter', 
      textTheme: const TextTheme(
        displayLarge: headingStyle,
        bodyLarge: bodyStyle,
        bodyMedium: bodyStyle,
      ),
    );
  }
}