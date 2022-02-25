import 'package:flutter/material.dart';
import 'package:ui_design_day_11_20/animation/fade_animation.dart';

class Day11Screen extends StatefulWidget {
  const Day11Screen({Key? key}) : super(key: key);

  @override
  _Day11ScreenState createState() => _Day11ScreenState();
}

class _Day11ScreenState extends State<Day11Screen> {
  final List bastDestination = [
    ["Canada", "assets/images/day11/canada.jpg"],
    ["ltaly", "assets/images/day11/Italy.jpg"],
    ["Greece", "assets/images/day11/greece.jpg"],
    ["United States", "assets/images/day11/united-states.jpg"],
  ];
  final List bastHotels = [
    ["Canada", "assets/images/day11/united-states.jpg"],
    ["ltaly", "assets/images/day11/greece.jpg"],
    ["Greece", "assets/images/day11/Italy.jpg"],
    ["United States", "assets/images/day11/canada.jpg"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/day11/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 50,
                      spreadRadius: 10,
                      offset: const Offset(0, 100),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const FadeAnimation(
                      child: Text(
                        "What you would like to finad?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    FadeAnimation(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 40),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search for cities, places ...",
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            FadeAnimation(
              child: BuildImageHorizontal(
                title: "Best Destination",
                bastList: bastDestination,
              ),
            ),
            const SizedBox(height: 20),
            FadeAnimation(
              child: BuildImageHorizontal(
                title: "Best Hotels",
                bastList: bastDestination,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildImageHorizontal extends StatelessWidget {
  const BuildImageHorizontal({
    Key? key,
    required this.bastList,
    required this.title,
  }) : super(key: key);

  final List bastList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            itemCount: bastList.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            separatorBuilder: (_, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) => Container(
              width: 210,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(bastList[index][1]), fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(begin: Alignment.bottomRight, colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.3),
                  ]),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text(
                    bastList[index][0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
