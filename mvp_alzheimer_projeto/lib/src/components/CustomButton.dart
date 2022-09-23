import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';


class DefaultButton extends StatefulWidget {
  Color color = Colors.green;
  VoidCallback  response = (){};
  String title="";
  Map bounds = {};
  bool enableBounds= false;
  DefaultButton({Key? key, required this.color, required this.response,required this.title,required this.bounds,required this.enableBounds}) : super(key: key);

  @override
  DefaultButtonState createState() => DefaultButtonState();
}

class DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: (widget.enableBounds)?widget.bounds.keys.first:100,
        height: (widget.enableBounds)?widget.bounds.values.first:50,
        child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: widget.color,

          ),
          onPressed: widget.response,
          child: BorderedText(
            strokeWidth: 1.0,
            child: Text(widget.title,style: TextStyle(fontSize: 30),),
          ),
        )
    );
  }
}
