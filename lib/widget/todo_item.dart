import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  String title;
  bool check;
  Function onChangeCheck;
  Function deleteItem;

  TodoItem({super.key, required this.title, required this.check, required this.onChangeCheck,
  required this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        ListTile(
          title: Text(title,
              style: TextStyle(
                  fontSize: 16,
                  decoration: check
                      ? TextDecoration.lineThrough
                      : TextDecoration.none)),
          trailing: Checkbox(
              value: check,
              onChanged: (onChanged) {
                onChangeCheck(onChanged);
              }),
          onLongPress: (){
            deleteItem();
          },
        ),
      ],
    );
  }
}
