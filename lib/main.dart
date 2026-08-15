import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const EssenceApp());
}

class EssenceApp extends StatelessWidget {
  const EssenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'Essence',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2B2118),
            brightness: Brightness.light,
          ),
          scaffoldBackgroundColor: const Color(0xFFFAF8F5),
          cardColor: Colors.white,
          textTheme: GoogleFonts.latoTextTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2B2118),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          chipTheme: ChipThemeData(
            backgroundColor: Colors.grey[200],
            selectedColor: const Color(0xFF2B2118),
            labelStyle: const TextStyle(fontSize: 13),
            secondaryLabelStyle: const TextStyle(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFAF8F5),
            foregroundColor: Colors.black,
            elevation: 0,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
