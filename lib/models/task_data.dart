import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_app/Screens/TaskScreen.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTasks(String newTaskName) {
    final task = Task(name: newTaskName);
    _tasks.insert(0, task);
    notifyListeners();
    getData(newTaskName, false);
  }

  void delTask(Task task) {
    _tasks.remove(task);
    removePrefs();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    getData(task.name, task.isDone);
    notifyListeners();
  }

  void getData(String taskName, bool isDone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', taskName);
    prefs.setBool('isDone', isDone);
    print('data got $taskName, $isDone');
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('stringValue');
    bool isDone = prefs.getBool('isDone');
//   _tasks.add(Task(name: stringValue));
//    print('loaded: "$stringValue", $isDone');
    addTasks(stringValue);
    _tasks.add(Task(name: stringValue));
    notifyListeners();
  }

  void removePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('stringValue');
    prefs.remove('isDone');
    print('removed !');
  }
}
