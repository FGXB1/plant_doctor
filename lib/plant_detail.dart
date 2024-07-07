import 'package:flutter/material.dart';
import 'package:plant_doctor/models/plant.dart';
import 'package:provider/provider.dart';

class PlantDetailPage extends StatelessWidget {
  const PlantDetailPage({super.key, required this.name, required this.img});
  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
                colors: [Color(0xffbbf76e), Color(0xff0b6809)],
                stops: [0.07, 1],
                center: Alignment.bottomCenter,
                radius: 2.0,
                focal: Alignment.bottomCenter,
                focalRadius: 0.1
            ),
          ),
        ),
      ),
      body: const Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 225.0),
            child: Text("damn bro's in the backrooms"),
          ),
        ),
       ),
    );
  }
}