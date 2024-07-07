import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/plant.dart';
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
    return ChangeNotifierProvider(
      create: (context) => PlantProvider(),
      child: MaterialApp(
        title: 'Plant Doctor',
        theme: ThemeData(
          colorScheme: kColorScheme,
          useMaterial3: true
        ),
        home: Homepage(),
      ),
    );
  }
}