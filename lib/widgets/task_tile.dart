import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_provider/provider/task_provider.dart';
import 'package:task_management_app_provider/widgets/delete_task_dialog.dart';
import 'package:task_management_app_provider/widgets/edit_task_dialog.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final int index;
  const TaskTile({super.key, required this.title, required this.isDone, required this.index});

  @override
  Widget build(BuildContext context) {
    final taskprovider=Provider.of<TaskProvider>(context, listen: false);
    return Card(
      child: ListTile(
        title: Text(title,
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : null),
        ),
        leading: Checkbox(
          value: isDone,
          onChanged: (value) {
            taskprovider.toggleTaskStatus(index);
          },
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => EditTaskDialog(index: index, currentTitle: title),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => DeleteTaskDialog(index: index),
                  );
                },
              ),
            ],
      )
      ),
    ));

  }
}