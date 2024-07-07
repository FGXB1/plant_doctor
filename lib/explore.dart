import 'package:flutter/material.dart';
import 'package:plant_doctor/plant_detail.dart';
import 'package:provider/provider.dart';
import './models/plant.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  final List<Plant> _plantList = [
    Plant(name: "Varigated Money Plant", img: "assets/images/iga01.png"),
    Plant(name: "Syngonium", img: "assets/images/iga02.png"),
    Plant(name: "Ariala Plant", img: "assets/images/iga03.png"),
    Plant(name: "Jade Plant", img: "assets/images/iga04.png"),
    Plant(name: "Pothos", img: "assets/images/iga05.png"),
    Plant(name: "Tulsi", img: "assets/images/iga06.png")
  ];

  void _selectPlant(context, String plantName, String plantImg) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PlantDetailPage(name: plantName, img: plantImg,)));
  }

  @override
  Widget build(BuildContext context) {
    final plantProvider = Provider.of<PlantProvider>(context);
    final providedList = plantProvider.plantList;

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
          itemCount: _plantList.length,
          itemBuilder: (context, index) => GestureDetector( // to make it clickable
            onTap: () => _selectPlant(context, providedList[index].name, providedList[index].img),
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
                      providedList[index].img,
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
                          providedList[index].name,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            
              // mine - problem was text took up too little space and image didn't get clipped right
              // child: Stack(
              //   alignment: AlignmentDirectional.bottomCenter,
              //   children: [
              //     Image.asset(_plantList[index].img,),
              //     Container(
              //       width: double.infinity,
              //       color: Colors.white,
              //       child: Text(_plantList[index].name, textAlign: TextAlign.center,)
              //     ),
              //   ],
              //   )
    
              // chat gpt produced this -- worked perfectly
    
              // chat gpt produced this one -- picture wasn't clipping right
              // Stack(
              //   alignment: AlignmentDirectional.bottomCenter,
              //   children: [
              //     Image.asset(_plantList[index].img),
              //     Container(
              //       width: double.infinity,
              //       color: Colors.white,
              //       height: 40, // Set the height as needed
              //       child: FittedBox(
              //         fit: BoxFit.scaleDown,
              //         child: Text(
              //           _plantList[index].name,
              //           textAlign: TextAlign.center,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
    
              // mine- problem was that text took up unnecessary space
              // Column(
              //   children: [
              //     Stack(
              //       alignment: AlignmentDirectional.bottomCenter,
              //       children: [
              //         Image.asset(_plantList[index].img),
              //             Container(
              //               width: double.infinity,
              //               color: Colors.white,
              //               child: Text(_plantList[index].name, textAlign: TextAlign.center)
              //             ),
              //       ],
              //     )
              //   ],
              // ),
          ),
          ),
        ),
      ),
    );
  }
}
