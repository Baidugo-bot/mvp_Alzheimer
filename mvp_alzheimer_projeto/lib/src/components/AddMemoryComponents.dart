import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  Color color = Colors.green;
  VoidCallback  response = (){};
  String title="";
  CustomButton({Key? key, required this.color, required this.response,required this.title}) : super(key: key);

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 50,
        child: ElevatedButton(
          style: TextButton.styleFrom(
          backgroundColor: widget.color,

          ),
          onPressed: widget.response,
          child: Text(widget.title),
        )
    );
  }
}
