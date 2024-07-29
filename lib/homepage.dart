// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plant_doctor/explore_plants/explore.dart';
import 'package:plant_doctor/live_connect.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  var hour = DateTime.now().hour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(hour < 12 ? 'Good Morning' : 'Good Evening'),
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
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Column(
              children: [
                Text(
                  'To plant a garden is to believe in tomorrow.',
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('~ Audrey Hepburn', style: TextStyle(fontSize: 20)),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Buttons(
                      cardText: 'Explore Plants',
                      icon: FontAwesomeIcons.magnifyingGlass,
                      route: ExplorePage(),
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Buttons(
                      cardText: 'Live Connect',
                      icon: FontAwesomeIcons.whatsapp,
                      route: LiveConnectPage(),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Buttons(
                      cardText: 'Common Problems',
                      icon: FontAwesomeIcons.plantWilt,
                      route: LiveConnectPage(),
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Buttons(
                      cardText: 'Calendar',
                      icon: FontAwesomeIcons.calendar,
                      route: LiveConnectPage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.cardText, required this.icon, required this.route});
  final String cardText;
  final IconData icon;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: 80,
        child: FilledButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => route
                )
              );
            },
            label: Text(cardText),
            icon: FaIcon(icon),
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            )),
      ),
    );
  }
}
