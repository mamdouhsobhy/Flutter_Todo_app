import 'package:flutter/material.dart';
import '../model/task.dart';

class BottomSheetScreen extends StatelessWidget {
  BottomSheetScreen({super.key, required this.addTask});

  final Function(String) addTask; // Specify the function type
  late String task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Make sure the height is just enough
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textAlign: TextAlign.center,
            "Add Task",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          TextField(
            autofocus: true,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            onChanged: (value) {
              task = value;
            },
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: () {
              addTask(task);
            },
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal[400],
            ),
          ),
        ],
      ),
    );
  }
}
