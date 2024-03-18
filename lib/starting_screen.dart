import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen(this.startTodo, {super.key});
  final void Function() startTodo;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/todo.png',
            width: 350,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Create your TODO list here!!!',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: startTodo,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.start_outlined),
            label: const Text('Start_TODO'),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
