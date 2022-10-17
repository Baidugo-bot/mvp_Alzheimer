import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bordered_text/bordered_text.dart';
import 'package:date_field/date_field.dart';

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
      child: (widget.haveFrame==true)?
      Column(
        children: [
          BorderedText(
              strokeWidth: 2,
              strokeColor: Colors.black26,
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 20,fontFamily: "Gidugu-Regular"),
              )
          ),
          Row(
            children: [
              Container(width: 10,),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.white,
                  child: TextField(
                    
                    style: TextStyle(color: Colors.black,fontFamily: "Gidugu-Regular"),
                    controller: widget.myResult  ,
                    

                    //onChanged: ,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      
                    ),
                  ),
                ),
              ),
              Container(width: 10,),
            ],
          )
        ],
      )
          :
      Row(
        children: [
          BorderedText(
              strokeWidth: 2,
              strokeColor: Colors.black26,
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 20,fontFamily: "Gidugu-Regular"),
              )),
          Expanded(
            child: Container(
              child: TextField(
                style: TextStyle(color: Colors.black,fontFamily: "Gidugu-Regular"),
                controller: widget.myResult  ,
                //onChanged: ,
                
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
  Function(DateTime) onChangeFunction = (DateTime date){};
  DateTime initialDate = DateTime.now();
  DateBorderedField({Key? key, required this.onChangeFunction, required this.initialDate}) : super(key: key);

  @override
  DateBorderedFieldState createState() => DateBorderedFieldState();
}

class DateBorderedFieldState extends State<DateBorderedField> {
  @override
  Widget build(BuildContext context) {
    DateTime holderDate = DateTime.now();

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          BorderedText(
            strokeColor: Colors.black26,
            strokeWidth: 2,
            child: Text("Data:",style: TextStyle(fontSize: 20,fontFamily: "Gidugu-Regular"),),
          ),
          Container(

            width: 200,
            child: DateTimeFormField(

                onDateSelected: (DateTime date){
                  widget.onChangeFunction(date);
                },
              firstDate: DateTime.now(),

                mode: DateTimeFieldPickerMode.date,
                //initialDate: DateTime.now().subtract(Duration(days: 1000000000000)),
                //lastDate: DateTime.now().add(Duration(days: 1)),

                dateTextStyle: TextStyle(color: Colors.black,fontFamily: "Gidugu-Regular"),

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

