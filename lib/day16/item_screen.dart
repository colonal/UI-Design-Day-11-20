import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  final List categories;
  const ItemScreen({required this.categories, Key? key}) : super(key: key);

  static const List prodect = [
    ["Beauty", "assets/images/day16/beauty-1.jpg", 100],
    ["Clothes", "assets/images/day16/clothes-1.jpg", 250],
    ["Perfume", "assets/images/day16/perfume.jpg", 150],
    ["Tech", "assets/images/day16/tech-1.jpg", 100],
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: categories[1],
              child: Container(
                width: width,
                height: height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(categories[1]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.2),
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 25,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 25,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          child: Center(
                            child: Text(
                              categories[0],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "New Product",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: const [
                          Text(
                            "View More",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                  ...prodect
                      .map((itme) => SizedBox(
                          width: width, height: 200, child: buildItme(itme)))
                      .toList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItme(itme) {
    return Container(
      margin: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: AssetImage(itme[1]), fit: BoxFit.cover),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
              size: 20,
            ),
            const Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itme[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${itme[2]} \$",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  radius: 15,
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                    size: 16,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
