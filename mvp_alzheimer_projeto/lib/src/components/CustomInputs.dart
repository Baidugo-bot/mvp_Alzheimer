
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {
  String title;
  bool haveFrame;
  TextEditingController myResult;
  bool beenChanged= false;
  //Funtion(String) onChanged;//on both
  DefaultTextField({Key? key, required this.title, required this.haveFrame, required this.myResult,}) : super(key: key);


  @override
  DefaultTextFieldState createState() => DefaultTextFieldState();
}

class DefaultTextFieldState extends State<DefaultTextField> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: Colors.black),
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
                style: TextStyle(color: Colors.white,fontFamily: "Gidugu-Regular"),
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

class DefaultMarkBox extends StatefulWidget {
  String title;
  Color color;
  bool myController;
  //Funtion(String) onChanged;//on both
  DefaultMarkBox({Key? key, required this.title,required this.color,required this.myController}) : super(key: key);


  @override
  DefaultMarkBoxState createState() => DefaultMarkBoxState();
}

class DefaultMarkBoxState extends State<DefaultMarkBox> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BorderedText(
            strokeWidth: 1.5,
            strokeColor: widget.color,
            child: Text(widget.title)
        ),
        Checkbox(value: widget.myController, onChanged: (value){widget.myController = !widget.myController;})
      ],
    );
  }
}

