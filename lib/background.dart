import 'package:flutter/material.dart';
import 'package:to_do/starting_screen.dart';
import 'package:to_do/str_screen.dart';

class Background extends StatefulWidget {
  const Background({super.key});
  @override
  State<Background> createState() {
    return _Background();
  }
}

class _Background extends State<Background> {
  @override
  var activescreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activescreen = 'task-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartingScreen(switchScreen);
    if (activescreen == 'task-screen') {
      screenWidget = const StrScreen();
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 73, 100, 200),
                Color.fromARGB(255, 98, 97, 152),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
