import 'package:flutter/material.dart';

import 'package:bordered_text/bordered_text.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import '../models/MemoryModel.dart';

class BorderedTextField extends StatefulWidget {
  String title;
  bool haveFrame;
  TextEditingController myResult;
  bool beenChanged= false;
   //Funtion(String) onChanged;//on both
  BorderedTextField({Key? key, required this.title, required this.haveFrame, required this.myResult,}) : super(key: key);


  @override
  BorderedTextFieldState createState() => BorderedTextFieldState();
}

class BorderedTextFieldState extends State<BorderedTextField> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          BorderedText(
              strokeWidth: 2,
              strokeColor: Colors.brown,
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 20),
              )),
          Expanded(
            child: Container(
              child: TextField(
                controller: widget.myResult  ,
                //onChanged: ,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateBorderedField extends StatefulWidget {
  const DateBorderedField({Key? key}) : super(key: key);

  @override
  DateBorderedFieldState createState() => DateBorderedFieldState();
}

class DateBorderedFieldState extends State<DateBorderedField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          BorderedText(
            strokeColor: Colors.brown,
            strokeWidth: 2,
            child: Text("Data:",style: TextStyle(fontSize: 20),),
          ),
          Container(

            width: 200,
            child: DateTimeFormField(
                mode: DateTimeFieldPickerMode.date,
                initialDate: DateTime.now(),
                dateTextStyle: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none
                ),
              ),
          ),
        ],
      ),
    );
  }
}

