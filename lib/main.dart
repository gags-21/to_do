import 'package:flutter/material.dart';
import 'Screens/TaskScreen.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
///Hello This is second push/commit trial.