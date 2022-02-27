import 'package:flutter/material.dart';
import 'package:ui_design_day_11_20/animation/fade_animation.dart';
import 'package:ui_design_day_11_20/day15/shoes_screen.dart';

class Day15Screen extends StatefulWidget {
  const Day15Screen({Key? key}) : super(key: key);

  @override
  State<Day15Screen> createState() => _Day15ScreenState();
}

class _Day15ScreenState extends State<Day15Screen> {
  final List filterShoes = ["All", "Sneakers", "Football", "Soccer", "Golf"];
  int selectionFilter = 0;

  final List shoes = [
    ["Sneakers", "Nike", 100, false, "assets/images/day15/one.jpg"],
    ["Sneakers", "Nike", 150, false, "assets/images/day15/two.jpg"],
    ["Sneakers", "Nike", 180, false, "assets/images/day15/three.jpg"],
  ];
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
    debugPrint("showWidget: $showWidget");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Shoes",
          style: TextStyle(
            color: Colors.black,
            height: 1.1,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 25,
              )),
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: _itmeBuilderFilter,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 5),
                    itemCount: filterShoes.length),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: width,
                child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, index) =>
                        _itmeBuilderShoesCard(index, width),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: shoes.length),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _itmeBuilderFilter(context, int index) {
    return Container(
      width: 100,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selectionFilter == index ? Colors.grey[200] : Colors.white,
      ),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            selectionFilter = index;
          });
        },
        child: Text(
          filterShoes[index],
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }

  Widget _itmeBuilderShoesCard(int index, width) {
    return Material(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (_) =>
                  ShoesScreen(shoes: shoes[index], tag: index.toString())));
        },
        child: Hero(
          tag: index.toString(),
          child: Container(
            height: 200,
            width: width * 0.7,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(shoes[index][4]),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: const Offset(-1, 1))
              ],
            ),
            child: !showWidget
                ? null
                : Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.1),
                        ],
                      ),
                    ),
                    child: FadeAnimation(
                      duration: const Duration(milliseconds: 300),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 15, right: 20, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          shoes[index][0],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                        Text(
                                          shoes[index][1],
                                          style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          shoes[index][3] = !shoes[index][3];
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 15,
                                        child: Icon(
                                          shoes[index][3]
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                          color: shoes[index][3]
                                              ? Colors.redAccent
                                              : Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "${shoes[index][2]}\$",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
