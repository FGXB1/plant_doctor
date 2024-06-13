import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.cardText});
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return const Card.filled(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      color: Color(0xFFBEEDD4),
      child: SizedBox(
        height: 50,
        width: 100,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            // child: Text(
            //   cardText,
            //   style: const TextStyle(fontSize: 12),
            // )
            child: Icon(
              Icons.search,
              color: Colors.white,
              semanticLabel: "Explore Plants",
            ),
          ),
        ),
      ),
    );
  }
}
