import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_data.dart';
import 'package:todo_app/screens/bottom_sheet_screen.dart';
import 'package:todo_app/widget/listview_todo.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var providerTasks = Provider.of<TaskData>(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // Allow bottom sheet to take full screen height if necessary
            builder: (ctx) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: BottomSheetScreen(
                  addTask: (value) {
                    providerTasks.addTask(value);
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          );

        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.teal[400],
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  size: 45,
                  Icons.playlist_add_check,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "ToDayDo",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "${providerTasks.task.length} tasks",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: ListViewTodo(),
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
