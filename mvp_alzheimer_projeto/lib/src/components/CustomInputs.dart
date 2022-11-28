
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {
  String title;
  bool? haveFrame;
  TextEditingController myResult;
  bool beenChanged= false;
  bool? isPassword=false;
  //Funtion(String) onChanged;//on both
  DefaultTextField({Key? key, required this.title, required this.myResult, this.isPassword ,  this.haveFrame}) : super(key: key);


  @override
  DefaultTextFieldState createState() => DefaultTextFieldState();
}

class DefaultTextFieldState extends State<DefaultTextField> {


  @override
  Widget build(BuildContext context) {
    return Container(

      child: (widget.haveFrame==true)?
      Column(
        children: [

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
                       border: OutlineInputBorder(),
                      labelText: "Senha",
                        labelStyle: TextStyle(color: Colors.black)

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
          Expanded(
            child: Container(

              child: TextField(
                obscureText: widget.isPassword ??false,
                style: TextStyle(color: Colors.black,fontFamily: "Gidugu-Regular"),
                controller: widget.myResult  ,
                //onChanged: ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: widget.title,
                    labelStyle: TextStyle(color: Colors.black)
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
        Checkbox(
          value: widget.myController,
          onChanged: (bool? value){

            setState(() {
              widget.myController = value!;
            });
          }

        )
      ],
    );
  }
}

