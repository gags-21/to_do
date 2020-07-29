import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressed;

  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback, this.longPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress:longPressed ,
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: isChecked ? FontWeight.w300 : FontWeight.normal,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.blueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}

//(newValue) {
//setState(() {
//isChecked = newValue;
//});
//}
//class TaskCheckBox extends StatefulWidget {
//  @override
//  _TaskCheckBoxState createState() => _TaskCheckBoxState();
//}
//
//class _TaskCheckBoxState extends State<TaskCheckBox> {
//
//  @override
//  Widget build(BuildContext context) {
//    return
//  }
//}
