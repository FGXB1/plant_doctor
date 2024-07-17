import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    Plant(name: "Tulsi", img: "assets/images/iga06.png"),
    Plant(name: "Tulsi", img: "assets/images/iga06.png"),
    Plant(name: "Tulsi", img: "assets/images/iga06.png")
  ];

  // var plantMap = {
  //   0:
  //   {
  //     'Jade Plant',
  //     {"assets/images/iga05.png",/*path2, path3, ...*/ },
  //     {
  //       {"Water every week", FontAwesomeIcons.droplet},
  //       {/*highlight2_name, highlight2_logo*/},
  //       {/*highlight3_name, highlight3_logo*/}
  //     },
  //     {
  //       {"Light", "Jade plants love light, and young plants especially should be exposed to bright, indirect sunlight in order to thrive."},
  //       {/*attribute1_name2, attribute1_text*/},
  //       {/*attribute1_name3, attribute1_text*/},
  //     },
  //   },
  // };

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
        ["Part Sunlight", FontAwesomeIcons.sun]
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
