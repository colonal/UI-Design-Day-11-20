import 'package:flutter/material.dart';
import 'package:ui_design_day_11_20/day20/socks_screen.dart';

class Day20Screen extends StatefulWidget {
  const Day20Screen({Key? key}) : super(key: key);

  @override
  _Day20ScreenState createState() => _Day20ScreenState();
}

class _Day20ScreenState extends State<Day20Screen> {
  bool choose = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.45,
              child: Stack(
                children: [
                  Container(
                    width: width,
                    height: height * 0.40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.yellow[700]!,
                            Colors.yellow[400]!,
                            Colors.yellow[200]!,
                            Colors.yellow[100]!,
                          ]),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(45),
                          bottomLeft: Radius.circular(45)),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/day20/menu.png",
                              width: 25,
                              height: 20,
                              fit: BoxFit.fill,
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Best Online Socks Collection",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/day20/header-socks.png",
                                  fit: BoxFit.fill,
                                  height: height * 0.30,
                                  width: width * 0.35,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      height: 60,
                      width: width * 0.9,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(1, 1),
                              blurRadius: 20,
                              spreadRadius: 8)
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color: Colors.grey[700], fontSize: 20),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[800],
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Choose a category",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: 40,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: !choose ? Colors.pink[100] : Colors.grey[300]),
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          choose = !choose ? choose : false;
                        });
                      },
                      child: Text(
                        "Adult",
                        style: TextStyle(
                            color:
                                !choose ? Colors.pink[700] : Colors.grey[800],
                            fontSize: 18),
                      ),
                    ),
                  )),
                  Expanded(
                    child: Container(
                      height: 40,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: choose ? Colors.pink[100] : Colors.grey[300]),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            choose = choose ? choose : true;
                          });
                        },
                        child: Text(
                          "Children",
                          style: TextStyle(
                              color:
                                  choose ? Colors.pink[700] : Colors.grey[800],
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, right: 10),
                children: [
                  _makeCard(
                    image: "assets/images/day20/socks-one.png",
                    startColor: Colors.pink[700]!,
                    endColor: Colors.pink[300]!,
                  ),
                  const SizedBox(width: 10),
                  _makeCard(
                    image: "assets/images/day20/socks-two.png",
                    startColor: Colors.blue[700]!,
                    endColor: Colors.blue[300]!,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _makeCard({image, startColor, endColor}) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const SocksScreen())),
      child: Container(
        width: 200,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [startColor, endColor],
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[350]!,
                  blurRadius: 10,
                  offset: const Offset(5, 10))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Image.asset(
              image,
              width: 150,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
