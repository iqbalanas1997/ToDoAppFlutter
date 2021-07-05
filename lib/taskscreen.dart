import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:roundcheckbox/roundcheckbox.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  static const IconData bubble_chart_outlined =
      IconData(0xef03, fontFamily: 'MaterialIcons');

  bool selected = false;
  var output = "";
  List<dynamic> lst = ["Walk", "Lunch", "Work", "Study", "Dinner"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(80))),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    bubble_chart_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    height: 10,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, bottom: 30),
                    child: Text(
                      "Tasks",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: 60,
                //color: Colors.blue,
                margin: EdgeInsets.all(5),
                child: ListTile(
                  title: Text(
                    "${lst[index]}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration:
                            (selected) ? TextDecoration.lineThrough : null),
                  ),
                  trailing: Container(
                    width: 100,
                    height: 100,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            child: Icon(
                              Icons.edit,
                              size: 30,
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        title: Text("Edit Items"),
                                        content: TextField(
                                          onChanged: (value) {
                                            output = value;
                                          },
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  lst.replaceRange(index,
                                                      index + 1, {output});
                                                });
                                              },
                                              child: Text("Add")),
                                        ]);
                                  });
                            },
                          ),
                        ),

// //Delete
                        Container(
                          width: 40,
                          height: 40,
                          child: Container(
                            width: 50,
                            height: 50,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  lst.removeAt(index);
                                });
                              },
                              child: Icon(Icons.delete),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  leading: RoundCheckBox(
                    onTap: (val) {
                      setState(() {
                        this.selected = this.selected;
                      });
                    },
                    checkedWidget: Icon(Icons.check_box, color: Colors.white),
                    uncheckedWidget: Icon(Icons.check_box),
                    animationDuration: Duration(
                      seconds: 1,
                    ),
                  ),
                ),
              );
            },
            itemCount: lst.length,
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Item"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            lst.add(output);
                          });
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
