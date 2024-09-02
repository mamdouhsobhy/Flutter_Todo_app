import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widget/todo_item.dart';
import '../model/task.dart';
import '../model/task_data.dart';

class ListViewTodo extends StatelessWidget {

  ListViewTodo({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<TaskData>(
      builder: (mContext,taskData,child){
        return ListView.builder(
          itemBuilder: (ctx,index){
            return TodoItem(title:taskData.task[index].title,check:taskData.task[index].check,onChangeCheck: (isCheck){
              taskData.makeCheck(isCheck, index);
            },deleteItem: (){
              taskData.deleteItem(taskData.task[index]);
            });
          },
          itemCount: taskData.task.length,
        );
      }
    );
  }
}
