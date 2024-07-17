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
      "plantName" : "Varigated Money Plant",
      "plantImg" : "assets/images/iga01.png"
    },
  ];
}