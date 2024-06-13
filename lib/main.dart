import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF6EA71F)).copyWith(
  onSecondary: Colors.red
);

class StyledText extends StatelessWidget {
  const StyledText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Hello World',
      style: TextStyle(color: Colors.green, fontSize: 28),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Doctor',
      theme: ThemeData(
        colorScheme: kColorScheme,
        useMaterial3: true,
      ),
      home: const AboutPage(title: 'About Us'),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorScheme.inversePrimary,
        title: Text(title),
        ),
      body: Center(
        child: Column(
          children: [
            const Center(
              child: Text(
                'About us front text', 
              style: TextStyle(
                  fontSize: 28
                ),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              color: kColorScheme.primary,
              child: Center(
                child: Text(
                  "hi", 
                  style: TextStyle(
                    color: kColorScheme.onSecondary,
                  ),
                )
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Buttons(cardText: 'Explore Plants'),
                Buttons(cardText: 'Explore Plants')
            ],),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Buttons(cardText: 'Explore Plants'),
                Buttons(cardText: 'Explore Plants')
            ],),
            
          ],
        ),
      ),
    );
  }
}