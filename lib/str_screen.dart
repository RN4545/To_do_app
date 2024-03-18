import 'package:google_fonts/google_fonts.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:to_do/starting_screen.dart';

import 'package:to_do/tasklistscreen.dart';

class StrScreen extends StatefulWidget {
  const StrScreen({super.key});

  @override
  State<StrScreen> createState() {
    return _StrScreenState();
  }
}

class _StrScreenState extends State<StrScreen> {
  bool isTextFiledVisible = false;
  bool areTaskVisible = false;
  final _textFiledController = TextEditingController();
  List<String> selectedTasks = [];

  @override
  void dispose() {
    _textFiledController.dispose();
    super.dispose();
  }

  void addTasks(String task) {
    setState(() {
      selectedTasks.add(task);
      isTextFiledVisible = true;
      _textFiledController.clear();
      areTaskVisible = true;
    });
  }

  void deleteTasks() {
    setState(() {
      selectedTasks.clear();
    });
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'ADD OR DELETE TASK',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
          ),
          if (isTextFiledVisible)
            TextField(
              controller: _textFiledController,
              decoration: InputDecoration(
                hintText: 'Enter a new task',
                hintStyle: GoogleFonts.lato(
                    color: Colors.grey[400],
                    fontSize: 17,
                    fontStyle: FontStyle.italic),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                isTextFiledVisible = !isTextFiledVisible;
              });
              addTasks(_textFiledController.text);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            ),
            child: const Text('ADD-TASK'),
          ),
          // if (areTaskVisible)
          //   Expanded(
          //     // Provide size constraints for the list
          //     child: ListView.builder(
          //         itemCount: selectedTasks.length,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             title: Text(selectedTasks[index]),
          //             textColor: Colors.red,
          //           );
          //         }),
          //   ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              deleteTasks();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 29),
            ),
            child: const Text('DELETE-TASK'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskListScreen(tasks: selectedTasks),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
              child: const Text('Show-Task'))
        ],
      ),
    );
  }
}
