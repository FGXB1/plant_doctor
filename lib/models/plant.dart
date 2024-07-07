import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
const uuid = Uuid();

class Plant {
  Plant({required this.name, required this.img}) : id = uuid.v4();

  final String img;
  final String id;
  final String name;

}

class PlantProvider with ChangeNotifier {
  final List<Plant> plantList = [
    Plant(name: "Varigated Money Plant", img: "assets/images/iga01.png"),
    Plant(name: "Syngonium", img: "assets/images/iga02.png"),
    Plant(name: "Ariala Plant", img: "assets/images/iga03.png"),
    Plant(name: "Jade Plant", img: "assets/images/iga04.png"),
    Plant(name: "Pothos", img: "assets/images/iga05.png"),
    Plant(name: "Tulsi", img: "assets/images/iga06.png")
  ];
}