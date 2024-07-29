import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlantProvider with ChangeNotifier {

  final List<Map> plantMap = [
    {
      "plantName": "Varigated Money Plant",
      "plantImg": [
        "assets/images/iga01.png",
        "assets/images/iga02.png",
        "assets/images/iga03.png"
      ],
      "plantHighlights": [
        ["Easy Care", FontAwesomeIcons.seedling],
        ["Water 2-7 Days", FontAwesomeIcons.droplet],
        ["Part Sunlight", FontAwesomeIcons.sun],
        ["Testing", FontAwesomeIcons.code],
        ["More Testing", FontAwesomeIcons.codePullRequest],
      ],
      "plantAttributes": [
        ["Soil","Plant in rich, well-draining soil. A hight-quality potting mix that is peat-based or coir-based is best"],
        ["Temperature and humidity","Average household temperature and humidity are fine for the Varigated Money plant. But avoid overly dry conditions where possible"],
        ["Toxicity","Pet owners rejoice! Varigated Money Plant is pet-friendly and non-toxic to both dogs and cats."]
      ]
    },
    {
    "plantName": "Syngonium",
    "plantImg": [
      "assets/images/iga02.png",
      "assets/images/iga03.png",
      "assets/images/iga04.png"
    ],
    "plantHighlights": [
      ["Medium Care", FontAwesomeIcons.seedling],
      ["Water Every 3-7 Days", FontAwesomeIcons.droplet],
      ["Part-Full Sunlight", FontAwesomeIcons.sun]
    ],
    "plantAttributes": [
      ["Soil","Plant in a rich, well-drained potting mix"],
      ["Temperature and humidity","Syngonium prefers warm and humid conditions. Keep it in areas above 60°F if possible"],
      ["Fertilizer","Feed every month from March to August with liquid fertilizer"]
    ]
  }
  ];
}
