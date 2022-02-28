import 'package:flutter/material.dart';
import 'package:ui_design_day_11_20/day16/day_16_screen.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  static const List categories = [
    ["Beauty", "assets/images/day16/beauty.jpg"],
    ["Clothes", "assets/images/day16/clothes.jpg"],
    ["Perfume", "assets/images/day16/perfume.jpg"],
    ["Tech", "assets/images/day16/tech.jpg"],
  ];

  static const List bestSelling = [
    ["Tech", "assets/images/day16/tech.jpg"],
    ["Watch", "assets/images/day16/watch.jpg"],
    ["Clothes", "assets/images/day16/clothes-1.jpg"],
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.6,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/day16/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topLeft,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.2),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => const Day16Screen()));
                              },
                              icon: const Icon(Icons.favorite,
                                  color: Colors.white, size: 25)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_cart,
                                  color: Colors.white, size: 25))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Our New Products",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: const [
                                Text(
                                  "VIEW MORE",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.white, size: 25)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitleProdect("Categories"),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return buildPodectItme(
                              title: categories[index][0],
                              image: categories[index][1]);
                        },
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemCount: categories.length),
                  ),
                  const SizedBox(height: 20),
                  buildTitleProdect("Best Selling by Category"),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return buildPodectItme(
                              title: bestSelling[index][0],
                              image: bestSelling[index][1],
                              width: 190);
                        },
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemCount: bestSelling.length),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTitleProdect(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "All",
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget buildPodectItme(
      {required String title, required String image, double width = 150}) {
    return Container(
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.only(left: 15, bottom: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.2),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
