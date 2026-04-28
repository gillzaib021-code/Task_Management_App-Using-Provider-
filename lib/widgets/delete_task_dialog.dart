import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_provider/provider/task_provider.dart';

class DeleteTaskDialog extends StatelessWidget {
   final int index;
   DeleteTaskDialog({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 13, 40, 61),
      title: Text("Delete Task", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      content: Text("Are you sure you want to delete this task?", style: const TextStyle(color: Colors.white),),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel", style: TextStyle(color: Colors.white),),
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<TaskProvider>(context, listen: false).deleteTask(index);
            Navigator.of(context).pop();
          },
          child: Text("Delete", ),
        ),
      ],
    );
  }
}