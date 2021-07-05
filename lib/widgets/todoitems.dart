import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:flutter/material.dart';
import 'package:todoapplication/taskscreen.dart';

class TodoItems extends StatefulWidget {
  @override
  _TodoItemsState createState() => _TodoItemsState();
}

class _TodoItemsState extends State<TodoItems> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        // title: Text(("${TaskScreen.lst[index]}")),
        );
  }
}
