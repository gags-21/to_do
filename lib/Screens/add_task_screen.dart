import 'package:flutter/material.dart';
import 'package:flutter_app/models/task_data.dart';
//import 'package:flutter_app/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  static String taskName;
  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 100.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500)),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                taskName = value;
                //  print(taskName);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              color: Colors.lightBlue,
              splashColor: Colors.red,
              textColor: Colors.white,
              child: Text('Add it !',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400)),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTasks(taskName);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )),
    );
  }
}
