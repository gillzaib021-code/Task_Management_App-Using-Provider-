import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_provider/provider/task_provider.dart';

class EditTaskDialog extends StatelessWidget {
  final int index;
  final String currentTitle;
  const EditTaskDialog({super.key, required this.index, required this.currentTitle});

  @override
  Widget build(BuildContext context) {
    final taskcontroller = TextEditingController(text: currentTitle);
    return AlertDialog(
      backgroundColor:  const Color.fromARGB(255, 13, 40, 61),
      title: Text("Edit Task", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      content: TextField(
        controller: TextEditingController(text: currentTitle),
        decoration: InputDecoration(
          
        hintText: 'Enter new task',
        
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
            Navigator.pop(context);
          },
          child: Text("Cancel", style: TextStyle(color: Colors.white),),
        ),
        TextButton(
          onPressed: () {
            if (taskcontroller.text.isNotEmpty) {
              context.read<TaskProvider>().edittask(index, taskcontroller.text);
            }
            Navigator.pop(context);
          },
          child: Text("Save", style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}