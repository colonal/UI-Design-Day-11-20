import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_design_day_11_20/home/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexSelected = 0;

  void _next() {
    setState(() {
      if (indexSelected < screens.length - 1) {
        indexSelected++;
      } else {
        indexSelected = indexSelected;
      }
    });
  }

  void _preve() {
    setState(() {
      if (indexSelected > 0) {
        indexSelected--;
      } else {
        indexSelected = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            _preve();
          } else if (details.velocity.pixelsPerSecond.dx < 0) {
            _next();
          }
        },
        child: _buildCardScreen(width, height),
      ),
    );
  }

  Widget _buildCountPage(int index) {
    return Container(
      margin: const EdgeInsets.all(3),
      height: 5,
      width: 25,
      decoration: BoxDecoration(
        color: indexSelected == index
            ? Colors.black
            : const Color.fromARGB(255, 82, 74, 74),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildCardScreen(double width, double height) {
    return AspectRatio(
      aspectRatio: (width) / (height - height * 0.05),
      child: Container(
        width: width * 0.5,
        height: height * 0.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(screens[indexSelected][2]),
            fit: BoxFit.fitWidth,
            alignment: FractionalOffset.topCenter,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.transparent,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: height * 0.6,
                    width: width * 0.6,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: screens[indexSelected][4],
                          blurRadius: 50,
                          spreadRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          blurRadius: 50,
                          spreadRadius: 10,
                          offset: const Offset(0, 0),
                        )
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => screens[indexSelected][3]));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(screens[indexSelected][2]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.5),
                                      Colors.black.withOpacity(0.2),
                                      Colors.black.withOpacity(0.1),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    screens[indexSelected][0],
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    screens[indexSelected][1],
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  bottom: 10,
                  child: SizedBox(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...screens.map((e) {
                          var index = screens.indexOf(e);
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  indexSelected = index;
                                });
                              },
                              child: _buildCountPage(index));
                        }).toList()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
