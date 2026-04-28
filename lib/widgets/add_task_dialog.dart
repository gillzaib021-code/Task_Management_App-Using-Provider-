import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_provider/model/task_model.dart';
import 'package:task_management_app_provider/provider/task_provider.dart';

class AddTaskDialog extends StatelessWidget {

  final taskcontroller=TextEditingController();
  AddTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 13, 40, 61),
      title: Text("Add Task", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      content: TextField(
        controller: taskcontroller,
        decoration: InputDecoration(
          hintText: "Enter task name",
          hintStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10), 
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel", style: TextStyle(color: Colors.white),),
        ),
        ElevatedButton(
          onPressed: () {
           if (taskcontroller.text.isNotEmpty) {
              final task = TaskModel(title: taskcontroller.text);
              context.read<TaskProvider>().addTask(task);
              taskcontroller.clear();
            }
            Navigator.of(context).pop();
          },
          child: Text("Add", ),
        ),
      ],
    );
  }
}