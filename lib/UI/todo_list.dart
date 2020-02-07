import 'package:flutter/material.dart';
import 'package:flutter_app/UI/add_page.dart';
import 'package:flutter_app/model/task.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Task> _toDoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.grey,
              ),
              onPressed: () {
                return goToAddScreen(context);
              })
        ],
        title: Text(
          "ToDo List",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28.0,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: _toDoList.length > 0
          ? ListView.builder(
              itemCount: _toDoList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onHorizontalDragStart: (_) {
                    deletetask(index);
                  },
                  child: Container(
                    height: 100.0,
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.blue[100].withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: ListTile(
                      onTap: () => _markAsDone(index),
                      onLongPress: () => editTask(index),
                      title: Text(_toDoList[index].title),
                      trailing: Icon(
                        Icons.check_circle,
                        color: _toDoList[index].status
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ),
                  ),
                );
              })
          : Center(
              child: Text("nothing to do"),
            ),
    );
  }

  void goToAddScreen(BuildContext context) async {
    String _text =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddPage();
    }));
    _addToList(_text);
  }

  void _addToList(String text) {
    if (text.length > 0) {}
    Task task = Task(title: text, status: false);
    setState(() {
      _toDoList.add(task);
    });
  }

  void _markAsDone(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
                _toDoList[index].status ? "mark as not done?" : "mark as done"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel")),
                FlatButton(
                    onPressed: () {
                      setState(() {
                        _toDoList[index].status = !_toDoList[index].status;
                        Navigator.pop(context);
                      });
                    },
                    child: Text("Yes"))
              ],
            ),
          );
        });
  }

  void editTask(int index) async {
    String editedTitle =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddPage(textToEdit: _toDoList[index].title);
    }));
    _toDoList[index].title = editedTitle;
  }

  void deletetask(int index) {
    setState(() {
      _toDoList.removeAt(index);
    });
  }
}
