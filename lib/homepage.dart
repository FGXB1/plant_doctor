// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plant_doctor/live_connect.dart';
import 'package:plant_doctor/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  var hour = DateTime.now().hour;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hour < 12 ? 'Good Morning' : 'Good Evening'),
        backgroundColor: kColorScheme.primary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
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
                      route: LiveConnectPage(),
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
