import 'package:flutter/material.dart';
import 'package:ui_design_day_11_20/day11/fade_animation.dart';

class Day12Screen extends StatelessWidget {
  const Day12Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/day12/background.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                FadeAnimation(
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 200,
                            width: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/day12/light-1.png"),
                                fit: BoxFit.fill,
                              ),
                            )),
                        Container(
                            height: 150,
                            width: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/day12/light-2.png"),
                                fit: BoxFit.fill,
                              ),
                            )),
                        Container()
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 50,
                  child: FadeAnimation(
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/day12/clock.png"),
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                ),
                const Positioned(
                  bottom: 150,
                  left: 150,
                  child: FadeAnimation(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: FadeAnimation(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 2),
                          blurRadius: 40,
                          spreadRadius: 15,
                        )
                      ]),
                      child: Column(
                        children: [
                          buildTextField(
                            hint: "Email or Phone number",
                            type: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 1),
                          buildTextField(
                            hint: "Password",
                            type: TextInputType.visiblePassword,
                            isPassword: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 60,
                      width: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.indigo,
                          Colors.indigo[400]!,
                          Colors.indigo[300]!,
                          Colors.indigo[200]!,
                        ]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 20,
                              fontFamily: "Nunito",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
      {required String hint,
      required TextInputType type,
      bool isPassword = false}) {
    return Container(
      height: 60,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        keyboardType: type,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontFamily: "Nunito",
            )),
        obscureText: isPassword,
      ),
    );
  }
}
