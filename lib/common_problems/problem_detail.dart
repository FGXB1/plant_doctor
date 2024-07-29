import 'package:flutter/material.dart';
import 'package:plant_doctor/main.dart';

/*
main image
symptoms of problem
treatment

3 types of data BLOCKS
  1. defines type of information that is there
  2. doesn't restrict amount of information
    - as many features of the plant that can be found
*/

class ProblemDetailPage extends StatefulWidget {
  const ProblemDetailPage(
      {super.key,
      required this.problemMap});
  final Map<dynamic, dynamic> problemMap;

  @override
  State<ProblemDetailPage> createState() => _ProblemDetailPageState();
}

class _ProblemDetailPageState extends State<ProblemDetailPage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.problemMap["problemName"]),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Image.asset(widget.problemMap['problemImg']),
            const SizedBox(height: 15),
            const Align(
              // for some reason all the text is centered so used this
              alignment: Alignment.centerLeft,
              child: Text(
                "Symptoms",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            const SizedBox(height: 15),
            GridView.builder(
              // to make sure grid view doesn't scroll, allows rest of the page to scroll
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap:
                  true, // so that it doesn't take up infinite space (overflow error without this)
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // max of 3 in one line
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: widget.problemMap['problemSymptoms'].length,
              itemBuilder: (context, index) => Symptom(
                highlightText: widget.problemMap['problemSymptoms'][index]//[0],
                //highlightIcon: widget.problemMap['problemSymptoms'][index][1],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ListView.separated(
              controller: ScrollController(keepScrollOffset: false),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              shrinkWrap: true, // same as GridView
              itemCount: widget.problemMap['problemTreatment'].length,
              itemBuilder: (context, index) => Treatment(
                treatmentName: widget.problemMap['problemTreatment'][index][0],
                treatmentText: widget.problemMap['problemTreatment'][index][1],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Symptom extends StatelessWidget {
  const Symptom(
      {super.key, required this.highlightText});
  final String highlightText;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // rounded rectangle
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        color: kColorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                highlightText,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Spacer() // more dynamic space
          ],
        ),
      ),
    );
  }
}

class Treatment extends StatelessWidget {
  const Treatment(
      {super.key, required this.treatmentName, required this.treatmentText});
  final String treatmentName;
  final String treatmentText;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // more rounded rectangles
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        color: kColorScheme.primary,
        child: ExpansionTile(
          // playing with colors (kinda don't like it but u can see if u like something better)
          backgroundColor: kColorScheme.onPrimaryFixedVariant,
          iconColor: kColorScheme.inversePrimary,
          collapsedIconColor: Colors.white,
          textColor: kColorScheme.inversePrimary,
          collapsedTextColor: Colors.white,
          // opening speed basically lol
          expansionAnimationStyle: AnimationStyle(
            curve: Curves.fastEaseInToSlowEaseOut,
            reverseCurve: Curves.bounceOut,
            duration: Durations.medium1,
            reverseDuration: Durations.short4,
          ),
          title: Text(
            treatmentName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ListTile(
                title: Text(
                  treatmentText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
