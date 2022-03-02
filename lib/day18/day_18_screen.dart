import 'package:flutter/material.dart';

class Day18Screen extends StatefulWidget {
  const Day18Screen({Key? key}) : super(key: key);

  @override
  State<Day18Screen> createState() => _Day18ScreenState();
}

class _Day18ScreenState extends State<Day18Screen> {
  // ItemScrollController _scrollController = ItemScrollController();
  final ScrollController _controller = ScrollController();
  final List data = [
    ["Hugo Boss Oxygen", 70, 4, 100, "assets/images/day18/watch-1.jpg"],
    ["Casio G-Shock Premium", 70, 2.5, 80, "assets/images/day18/watch-2.jpg"],
    ["Hugo Boss Signature", 70, 4.5, 120, "assets/images/day18/watch-3.jpg"]
  ];

  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView.builder(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) => GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  _controller.animateTo(
                    _controller.position.pixels - width, // move slider to left
                    duration: const Duration(
                      seconds: 1,
                    ),
                    curve: Curves.ease,
                  );
                  setState(() {
                    if (indexSelected != 0) --indexSelected;
                  });
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  _controller.animateTo(
                    _controller.position.pixels + width, // move slider to left
                    duration: const Duration(
                      seconds: 1,
                    ),
                    curve: Curves.ease,
                  );
                  setState(() {
                    if (indexSelected < data.length - 1) ++indexSelected;
                  });
                }
              },
              child: _buildPageScreen(height, width, index))),
    );
  }

  SizedBox _buildPageScreen(double height, double width, int index) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(data[index][4]), fit: BoxFit.fill),
            ),
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.1),
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...data.map((e) {
                        var index = data.indexOf(e);
                        return buildCountPage(index);
                      }).toList()
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(20),
                    width: width,
                    height: height * 0.4,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            data[index][0],
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[900]!.withOpacity(0.9)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${data[index][3]} \$",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orangeAccent[400]!
                                      .withOpacity(0.9)),
                            ),
                            _buildStarsReviws(
                                double.parse(data[index][2].toString())),
                            Text(
                              "(${data[index][2]} /${data[index][1]} reviews)",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.withOpacity(0.9)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "ADD TO CART",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCountPage(int index) {
    return Container(
      margin: const EdgeInsets.all(3),
      height: 5,
      width: 25,
      decoration: BoxDecoration(
        color: indexSelected == index ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  _buildStarsReviws(double d) {
    debugPrint("$d");
    int num1 = int.parse(d.toString().split(("."))[0]);
    int num2 = int.parse(d.toString().split(("."))[1]);

    return SizedBox(
      height: 30,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            debugPrint("${num1 == index && num2 >= 4}");
            return Icon(
              num1 == index && num2 >= 4
                  ? Icons.star_half
                  : num1 > index
                      ? Icons.star
                      : Icons.star_outline,
              color: Colors.orangeAccent[400]!,
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
                width: 5,
              ),
          itemCount: 5),
    );
  }
}
