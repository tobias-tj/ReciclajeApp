import 'package:flutter/material.dart';
import 'package:reciclaje_app/screens/home_screen.dart';
import 'package:reciclaje_app/screens/my_splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Color(0xFF33DD2D),
          secondary: Color(0xFF94EAB5),
          background: Color(0xFF0c2f42),
          surface: Color(0xFFEFFFEF),
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onBackground: Colors.white,
          onSurface: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MySplash(),
    );
  }
}
