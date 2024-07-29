import 'package:flutter/material.dart';
import 'package:plant_doctor/common_problems/models/problem.dart';
import 'package:provider/provider.dart';
import 'explore_plants/models/plant.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color(0xFF6EA71F)).copyWith(
  primary: const Color(0xFF6EA71F),
  onPrimaryFixedVariant: const Color(0xFF557A23),
  inversePrimary: const Color(0xFFC1E096),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PlantProvider>(create: (context) => PlantProvider(),),
        ChangeNotifierProvider<ProblemProvider>(create: (context) => ProblemProvider(),),
      ],
      child: MaterialApp(
          title: 'Plant Doctor',
          theme: ThemeData(colorScheme: kColorScheme, useMaterial3: true),
          home: Homepage()),
    );
  }
}
