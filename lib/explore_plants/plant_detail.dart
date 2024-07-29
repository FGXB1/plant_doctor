import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plant_doctor/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

class PlantDetailPage extends StatefulWidget {
  const PlantDetailPage(
      {super.key,
      required this.plantMap});
  final Map<dynamic, dynamic> plantMap;

  @override
  State<PlantDetailPage> createState() => _PlantDetailPageState();
}

class _PlantDetailPageState extends State<PlantDetailPage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.plantMap["plantName"]),
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
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn, // animation
                // for dots below
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              itemCount: widget.plantMap['plantImg'].length,
              itemBuilder: (context, index, realIndex) {
                // idk what realIndex is either
                final image = widget.plantMap['plantImg'][index];

                return buildImage(image, index);
              },
            ),
            // scrolling dots -- separate package
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.plantMap['plantImg'].length,
              effect: const ScaleEffect(
                // animation
                activeDotColor: Colors.green,
                dotWidth: 10,
                dotHeight: 10,
              ),
            ),
            const SizedBox(height: 15),
            const Align(
              // for some reason all the text is centered so used this
              alignment: Alignment.centerLeft,
              child: Text(
                "Key Features",
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
              itemCount: widget.plantMap['plantHighlights'].length,
              itemBuilder: (context, index) => Highlight(
                highlightText: widget.plantMap['plantHighlights'][index][0],
                highlightIcon: widget.plantMap['plantHighlights'][index][1],
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
              itemCount: widget.plantMap['plantAttributes'].length,
              itemBuilder: (context, index) => Attribute(
                attributeName: widget.plantMap['plantAttributes'][index][0],
                attributeText: widget.plantMap['plantAttributes'][index][1],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildImage(String urlImage, int index) => Container(
      margin: const EdgeInsets.all(25),
      child: Image.asset(urlImage),
    );

class Highlight extends StatelessWidget {
  const Highlight(
      {super.key, required this.highlightText, required this.highlightIcon});
  final String highlightText;
  final IconData highlightIcon;

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
            FaIcon(
              highlightIcon,
              color: Colors.white,
            ),
            const Spacer(), // just dynamically adds space
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

class Attribute extends StatelessWidget {
  const Attribute(
      {super.key, required this.attributeName, required this.attributeText});
  final String attributeName;
  final String attributeText;

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
            attributeName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ListTile(
                title: Text(
                  attributeText,
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
