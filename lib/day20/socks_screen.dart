import 'package:flutter/material.dart';
import 'package:ui_design_day_11_20/animation/fade_animation.dart';

class SocksScreen extends StatefulWidget {
  const SocksScreen({Key? key}) : super(key: key);

  @override
  State<SocksScreen> createState() => _SocksScreenState();
}

class _SocksScreenState extends State<SocksScreen> {
  int selectColor = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.pinkAccent[400]!,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height * 0.4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.pinkAccent[400]!,
                    Colors.pink[300]!,
                  ],
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Center(
                      child: Image.asset(
                          "assets/images/day20/details-page-header.png"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              // height: height * 0.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FadeAnimation(
                      duration: Duration(milliseconds: 500),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'Ranger Sport',
                          style: TextStyle(
                              color: Color.fromRGBO(97, 90, 90, .54),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const FadeAnimation(
                      duration: Duration(milliseconds: 600),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "Ankle Men's Athletic Socks",
                          style: TextStyle(
                              color: Color.fromRGBO(97, 90, 90, 1),
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const FadeAnimation(
                      duration: Duration(milliseconds: 800),
                      child: Text(
                        "Ranger sport socks are a fusion of materials of the sturdiest quality and versatile design that suits all purposes. Each pair of Ranger socks is knitted from 100% combed cotton yarn running along a reinforced 2-Ply core polyester based elastic through out the socks.",
                        style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 0.54),
                          height: 1.4,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        _buildCircleAvatarColors(index: 0, color: Colors.black),
                        const SizedBox(height: 10),
                        _buildCircleAvatarColors(index: 1, color: Colors.pink),
                        const SizedBox(height: 10),
                        _buildCircleAvatarColors(
                            index: 2, color: Colors.blue[200]!),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "More option",
                      style: TextStyle(color: Colors.grey[600]!, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          FadeAnimation(
                              child: AspectRatio(
                            aspectRatio: 3.2 / 1,
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 56,
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Color.fromRGBO(251, 53, 105, 1)),
                                    child: Image.asset(
                                        'assets/images/day20/socks-icon.png'),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Ankle Length Socks',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(97, 90, 90, 1),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        '23,345',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(97, 90, 90, .7),
                                            fontSize: 13),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                          FadeAnimation(
                              child: AspectRatio(
                            aspectRatio: 3.2 / 1,
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 56,
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Color.fromRGBO(81, 234, 234, 1)),
                                    child: Image.asset(
                                        'assets/images/day20/socks-icon-left.png'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Quarter Length Socks',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(97, 90, 90, 1),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        '23,345',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(97, 90, 90, .7),
                                            fontSize: 13),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.all(10),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              colors: [Colors.pink[600]!, Colors.pink[300]!])),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: const [
                                  Text(
                                    '\$14.',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('54',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                              const Text(
                                'Pay',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildCircleAvatarColors({index, color}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectColor = index;
        });
      },
      child: CircleAvatar(
        radius: 24,
        backgroundColor: selectColor == index ? Colors.red : Colors.white,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 17,
            backgroundColor: color,
          ),
        ),
      ),
    );
  }
}
