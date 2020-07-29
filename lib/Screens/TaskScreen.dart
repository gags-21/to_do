import 'package:flutter/material.dart';
import 'package:flutter_app/models/task_data.dart';
import 'package:flutter_app/widgets/task_lists.dart';
import 'add_task_screen.dart';
//import 'package:flutter_app/models/task.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    TaskData().loadData();
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          focusColor: Colors.black54,
          splashColor: Colors.red,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              enableDrag: true,
              elevation: 10.0,
              barrierColor: Colors.lightBlue.withAlpha(100),
              context: context,
              builder: (context) => AddTask(),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 100.0, bottom: 20.0, right: 20.0, left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(
                    Icons.format_list_bulleted,
                    size: 30.0,
                    color: Colors.lightBlue,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 1.0,
                  //radius: 30.0,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'ToDo',
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 5.0),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    //spreadRadius: 2.0,
                    offset: Offset(0.0, -1.0),
                  ),
                ],
              ),
              child: TaskLists(),
            ),
          ),
        ],
      ),
    );
  }
}
