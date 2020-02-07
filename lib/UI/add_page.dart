import 'package:flutter/material.dart';

class AddPage extends StatefulWidget{
  String textToEdit;
  AddPage({this.textToEdit});
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _textEditingController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController(text: widget.textToEdit!=null?widget.textToEdit:"");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("apple",
        style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
body: Column(
  children: <Widget>[Container(
    height: 100,
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.orange,
        width: 2.0
      ),
      borderRadius: BorderRadius.circular(8.0),

    ),
    child: TextFormField(
      controller: _textEditingController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: "do nothing",
        border: InputBorder.none

      ),
    ),
  ),
    SizedBox(height: 10.0,),
    InkWell(onTap:(){
      Navigator.pop(context,_textEditingController.text.toString());
    },child: Text("SAVE",
      style: TextStyle(fontStyle: FontStyle.italic),
    ))

  ],
),
    );
  }
}