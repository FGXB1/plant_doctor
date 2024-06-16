import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF6EA71F)).copyWith(
  primary: const Color(0xFF6EA71F)
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Doctor',
      theme: ThemeData(
        colorScheme: kColorScheme,
        useMaterial3: true
      ),
      home: Homepage(),
    );
  }
}
