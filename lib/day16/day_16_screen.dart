import 'package:flutter/material.dart';
import 'package:ui_design_day_11_20/day16/shop_screen.dart';

class Day16Screen extends StatefulWidget {
  const Day16Screen({Key? key}) : super(key: key);

  @override
  State<Day16Screen> createState() => _Day16ScreenState();
}

class _Day16ScreenState extends State<Day16Screen> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        opacity: show ? 1 : 0,
        onEnd: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const ShopScreen()));
        },
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/images/day16/splash.jpg",
            ),
            fit: BoxFit.cover,
          )),
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
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Brand New Perspective",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      height: 1.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Let's start with our summer collection.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 50),
                  buildButtonLogin(
                    "Get Start",
                    Colors.white,
                    Colors.black,
                    onPressed: () {
                      setState(() {
                        show = false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  buildButtonLogin(
                      "Create Account", Colors.transparent, Colors.white,
                      onPressed: () {
                    Navigator.of(context).pop();
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildButtonLogin(String title, Color background, Color colorText,
      {void Function()? onPressed}) {
    return Container(
      height: 50,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: colorText,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
