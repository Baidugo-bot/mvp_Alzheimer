import 'package:flutter/material.dart';

Widget circleDay(day, context, enabled) {
  return Container(
    width: 45.0,
    height: 45.0,
    decoration: BoxDecoration(
      color: enabled ? Colors.green  : Colors.grey,
      borderRadius: BorderRadiusDirectional.circular(100.0),
    ),
    child: Padding(
      padding: EdgeInsets.all(1.0),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontFamily: 'italic',
          ),
        ),
      ),
    ),
  );
}
