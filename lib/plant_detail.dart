import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import './models/plant.dart';

/* 

main image slideshow
main attributes of plant -- highlights
technical attributes (rotation, water needed, etc etc)  

3 types of data BLOCKS
  1. defines type of information that is there
  2. doesn't restrict amount of information
    - as many features of the plant that can be found

  one feature can have a logo and a title
  - a technical attribute could have a title, dropdown and text and maybe an image

*/

class PlantDetailPage extends StatelessWidget {
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

  PlantDetailPage({
    super.key,
    required this.name,
    required this.img,
    /* required this.plantMap */
  });
  final String name;
  final String img;
  // final Set<Object> plantMap;

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
                  focalRadius: 0.1),
            ),
          ),
        ),
        body: Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(height: 200),
              itemCount: plantList.length,
              itemBuilder: (context, index, realIndex) {
                final image = plantList[index].img;

                return buildImage(image, index);
              },
            ),
            ListView.builder(
              itemCount: plantMap[]['plantAttributes'].length,
              itemBuilder: (context, index){
                return Attribute(
                  attributeName: providedplantMap['plantAttributes'][index][0],
                  attributeText: providedplantMap['plantAttributes'][index][1]);
              }
            ),
            const Attribute(
                attributeName: "Paani do", attributeText: "10 days a week :)")
          ],
        ));
  }
}

Widget buildImage(String urlImage, int index) => Container(
      margin: const EdgeInsets.all(25),
      child: Image.asset(urlImage),
    );

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Attribute extends StatelessWidget {
  const Attribute(
      {super.key, required this.attributeName, required this.attributeText});
  final String attributeName;
  final String attributeText;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(attributeName),
      children: <Widget>[
        ListTile(title: Text(attributeText)),
      ],
    );
  }
}
