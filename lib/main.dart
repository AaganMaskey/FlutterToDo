import 'package:flutter/material.dart';
import 'package:flutter_app/UI/todo_list.dart';

void main(){
  return runApp(ToDoApp());

}
class ToDoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "To Do app",
      debugShowCheckedModeBanner: false,
      home: ToDoList(),
    );
  }

}