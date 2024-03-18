import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskListScreen extends StatelessWidget {
  final List<String> tasks;
  const TaskListScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: const Text('Task List'),
        // backgroundColor: Colors.grey[700],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 1),
        itemCount: tasks.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 4, // Adjust the height of the divider as needed
          );
        },
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              tasks[index],
              style: GoogleFonts.lato(
                  color: Colors.red[400],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            // textColor: Colors.red,
          );
        },
      ),
    );
  }
}
