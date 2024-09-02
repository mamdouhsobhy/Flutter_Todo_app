import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> task = [];

  void addTask(String title){
    task.add(Task(title: title, check: false));
    notifyListeners();
  }


  void makeCheck(bool check,int index){
    task[index].check = check;
    notifyListeners();
  }


  void deleteItem(Task mTask){
    task.remove(mTask);
    notifyListeners();
  }

}