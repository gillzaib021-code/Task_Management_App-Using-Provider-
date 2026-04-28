import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management_app_provider/model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  
  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;


  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    _tasks[index].isdone = !_tasks[index].isdone;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
   

   Future<void> savetasks()async{
    final prefs= await SharedPreferences.getInstance();
    String tasklist= _tasks.map((tasks)=>jsonEncode(tasks.toMap())).toString();
    prefs.setString('tasks', tasklist);
   }


  Future<void> loadtasks()async{
    final prefs=await SharedPreferences.getInstance();
    List<String>? tasklist= prefs.getStringList('tasks');
    if (tasklist !=null) {
      _tasks=tasklist.map((tasks)=>TaskModel.fromMap(jsonDecode(tasks))).toList();
    }
  }


 Future<void> edittask(int index, String newtitle)async{
    _tasks[index].title=newtitle;
    notifyListeners();
  }

}