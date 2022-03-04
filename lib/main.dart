import 'package:flutter/material.dart';
import 'package:ui_design_day_11_20/day12/day_12_screen.dart';

import 'day11/day_11_screen.dart';
import 'day13/day_13_screen.dart';
import 'day14/day_14_screen.dart';
import 'day15/day_15_screen.dart';
import 'day16/day_16_screen.dart';
import 'day18/day_18_screen.dart';
import 'day19/day_19_screen.dart';
import 'day20/day_20_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI-Design-Day-11-20',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Day11Screen()),
                );
              },
              child: const Text("DAY 11"),
              color: Colors.redAccent,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Day12Screen()),
                );
              },
              child: const Text("DAY 12"),
              color: Colors.redAccent,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Day13Screen()),
                );
              },
              child: const Text("DAY 13"),
              color: Colors.redAccent,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Day14Screen()),
                );
              },
              child: const Text("DAY 14"),
              color: Colors.redAccent,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Day15Screen()),
                );
              },
              child: const Text("DAY 15"),
              color: Colors.redAccent,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Day16Screen()),
                );
              },
              child: const Text("DAY 16"),
              color: Colors.redAccent,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Day16Screen()),
                );
              },
              child: const Text("DAY 17"),
              color: Colors.redAccent,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Day18Screen()),
                );
              },
              child: const Text("DAY 18"),
              color: Colors.redAccent,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Day19Screen()),
                );
              },
              child: const Text("DAY 19"),
              color: Colors.redAccent,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Day20Screen()),
                );
              },
              child: const Text("DAY 20"),
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
