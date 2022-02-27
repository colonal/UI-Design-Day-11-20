import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui_design_day_11_20/animation/fade_animation.dart';
import 'package:ui_design_day_11_20/day15/day_15_screen.dart';

class ShoesScreen extends StatefulWidget {
  const ShoesScreen({required this.tag, required this.shoes, Key? key})
      : super(key: key);
  final List shoes;
  final String tag;

  @override
  _ShoesScreenState createState() => _ShoesScreenState();
}

class _ShoesScreenState extends State<ShoesScreen> {
  List size = [40, 42, 44, 46];
  int sizeSelected = 0;
  bool showWidget = false;

  @override
  void initState() {
    super.initState();
    timer();
  }

  void timer() async {
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      showWidget = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: widget.tag,
          child: Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.shoes[4]), fit: BoxFit.cover),
            ),
            child: !showWidget
                ? null
                : Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.1),
                        ])),
                    child: FadeAnimation(
                        duration: const Duration(milliseconds: 500),
                        child: _buildBadyWidget(width))),
          ),
        ),
      ),
    );
  }

  Widget buildSizeWidget(int index) {
    return Container(
      width: 30,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: sizeSelected == index ? Colors.grey[200] : Colors.transparent,
      ),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            sizeSelected = index;
          });
        },
        child: Text(
          size[index].toString(),
          style: TextStyle(
              color: sizeSelected == index ? Colors.black : Colors.white,
              fontSize: 12),
        ),
      ),
    );
  }

  _buildBadyWidget(width) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const Day15Screen()));
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.white,
                  )),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // widget.shoes[index][3] = !widget.shoes[index][3];
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    widget.shoes[3]
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: widget.shoes[3] ? Colors.redAccent : Colors.black,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.shoes[0],
                style: const TextStyle(
                  color: Colors.white,
                  height: 1.1,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Size",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  height: 30,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, int index) =>
                          buildSizeWidget(index),
                      separatorBuilder: (_, __) => const SizedBox(width: 5),
                      itemCount: size.length)),
              SizedBox(height: width * 0.2),
              Container(
                width: width,
                height: 50,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future sleep() {
    return Future.delayed(const Duration(seconds: 2), () => "2");
  }
}
