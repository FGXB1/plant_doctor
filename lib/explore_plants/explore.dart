import 'package:flutter/material.dart';
import 'package:plant_doctor/explore_plants/plant_detail.dart';
import 'package:provider/provider.dart';
import 'models/plant.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  @override
  Widget build(BuildContext context) {
    final plantProvider = Provider.of<PlantProvider>(context);
    final plantMapList = plantProvider.plantMap;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Explore Plants'),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
          itemCount: plantMapList.length,
          itemBuilder: (context, index) => GestureDetector( // to make it clickable
            onTap: () => _selectPlant(context, plantMapList[index]),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              shadowColor: Colors.grey.withOpacity(0.5), // all of this was just styling to make it a rounded rectangle lol
              /*
              the flex in the expanded widgets in this column are just to have the spacing automatically make them 
              fill up all their space while making sure the corners of the image are clipped right
              */
              child: Column( 
                children: [
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      // _plantList[index].img,
                      plantMapList[index]["plantImg"][0],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          plantMapList[index]["plantName"],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ),
          ),
        ),
      ),
    );
  }
}

void _selectPlant(context, Map<dynamic, dynamic> plantMap) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PlantDetailPage(plantMap: plantMap,)));
  }