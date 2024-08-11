import 'package:flutter/material.dart';

class ProblemProvider with ChangeNotifier {

  final List<Map> problemMap = [
    {
      "problemName": "Symptom1",
      "problemImg": "assets/images/iga01.png",
      "problemSymptoms": [
        "Tilting",
        "Yellow",
      ],
      "problemTreatment": [
        ["Treatment1 Name","Treatment1 description"],
        ["Treatment2 Name","Treatment2 description"],
        ["Treatment3 Name","Treatment3 description"]
      ]
    },
    {
    "problemName": "Symptom2",
    "problemImg": "assets/images/iga02.png",
    "problemSymptoms": [
      "Holes in leaves",
      "Yellow",
    ],
    "problemTreatment": [
      ["Treatment1 Name","Treatment1 description"],
      ["Treatment2 Name","Treatment2 description"],
      ["Treatment3 Name","Treatment3 description"]
    ]
  }
  ];
}