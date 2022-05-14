import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class DateBorderedField extends StatefulWidget {
  Function(DateTime) onChangeFunction = (DateTime date){};
  DateBorderedField({Key? key, required this.onChangeFunction}) : super(key: key);

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
          Text("Data:",style: TextStyle(fontSize: 20,fontFamily: "Gidugu-Regular"),),
          Container(

            width: 200,
            child: DateTimeFormField(
                onDateSelected: (DateTime date){
                  widget.onChangeFunction(date);
                },
                mode: DateTimeFieldPickerMode.date,
                initialDate: holderDate,
                dateTextStyle: TextStyle(color: Colors.white,fontFamily: "Gidugu-Regular"),

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