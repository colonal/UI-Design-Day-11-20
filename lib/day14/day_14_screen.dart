import 'dart:ui';

import 'package:flutter/material.dart';

class Day14Screen extends StatelessWidget {
  const Day14Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange[900]!,
                    Colors.orange[800]!,
                    Colors.orange[400]!
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                        const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              height: 1.2),
                        ),
                        const Text(
                          "Welecome Back",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.only(top: 60, bottom: 30),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: width * .8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.orange[900]!.withOpacity(0.3),
                                  offset: const Offset(1, 1),
                                  spreadRadius: 5,
                                  blurRadius: 20),
                            ],
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              _buildLoginField("Email or Phone number"),
                              Divider(
                                color: Colors.grey.withOpacity(0.5),
                                height: 1,
                                endIndent: 10,
                              ),
                              _buildLoginField("Password",
                                  isPassword: true,
                                  keyboardType: TextInputType.visiblePassword),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildTextButton("Forgot Password?"),
                        const SizedBox(height: 20),
                        _buildLoginButton(
                            "Login", Colors.redAccent, width * 0.5),
                        const SizedBox(height: 30),
                        _buildTextButton("Continue with social media"),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildLoginButton(
                                "Facebook", Colors.blue, width * 0.5 / 1.5),
                            _buildLoginButton(
                                "Github", Colors.black, width * 0.5 / 1.5),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildLoginField(String hint,
      {bool isPassword = false,
      TextInputType keyboardType = TextInputType.emailAddress}) {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6), fontSize: 14),
      ),
      keyboardType: keyboardType,
      obscureText: isPassword,
    );
  }

  _buildTextButton(String text) {
    return TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey.withOpacity(0.6),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ));
  }

  _buildLoginButton(String text, Color color, double width) {
    return Container(
      height: 40,
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          text,
          style:
              const TextStyle(color: Colors.white, fontSize: 18, height: 1.1),
        ),
      ),
    );
  }
}
