// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: Text(
              'To plant a garden is to believe in tomorrow.',
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            // child: Align(
            //   alignment: Alignment.bottomCenter,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                padding: const EdgeInsets.all(25.0),
                childAspectRatio: 1.8,
                children: const [
                  Buttons(
                    cardText: 'Explore Plants',
                    icon: FontAwesomeIcons.magnifyingGlass,
                  ),
                  Buttons(
                    cardText: 'Live Connect',
                    icon: FontAwesomeIcons.whatsapp,
                  ),
                  Buttons(
                    cardText: 'Common Problems',
                    icon: FontAwesomeIcons.plantWilt,
                  ),
                  Buttons(
                    cardText: 'Calendar',
                    icon: FontAwesomeIcons.calendar,
                  ),
                ],
              ),
            ),
          // ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.cardText, required this.icon});
  final String cardText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: 80,
        child: FilledButton.icon(
            onPressed: () {},
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
