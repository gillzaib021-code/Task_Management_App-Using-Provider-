import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/task_provider.dart';
import '../widgets/add_task_dialog.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Manager", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 13, 40, 61),
        centerTitle: true,
      ),

      body: taskProvider.tasks.isEmpty
          ? const Center(
              child: Text(
                "No Tasks Yet 😔",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index];

                return TaskTile(
                  title: task.title,
                  isDone: task.isdone,
                  index: index,
                );
              },
            ),

      // ➕ Add Task Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 13, 40, 61),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AddTaskDialog(),
          );
          
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}