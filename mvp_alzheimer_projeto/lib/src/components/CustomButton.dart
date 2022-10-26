import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

import '../../AppController.dart';




class DefaultButton extends StatefulWidget {
  Color color = Colors.green;
  VoidCallback  response = (){};
  String title="";
  Map bounds = {};
  bool enableBounds= false;
  bool? circularBounds = false;
  DefaultButton({Key? key, this.circularBounds,required this.color, required this.response,required this.title,required this.bounds,required this.enableBounds}) : super(key: key);

  @override
  DefaultButtonState createState() => DefaultButtonState();
}

class DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: (widget.enableBounds)?widget.bounds.keys.first:100,
        height: (widget.enableBounds)?widget.bounds.values.first:50,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.black,
              style: BorderStyle.solid,
            ),
            borderRadius: (widget.circularBounds==true)? BorderRadius.all(Radius.circular(50.0)):null,
          ),
          child: ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: widget.color,

            ),
            onPressed: widget.response,
            child: BorderedText(
              strokeWidth: 1.0,
              child: Text(widget.title,style: TextStyle(fontSize: 30),),
            ),
          ),
        )
    );
  }
}


/*class CustomAppBar extends StatefulWidget {

  CustomAppBar({Key? key,}) : super(key: key);

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return
  }
}*/

class CustomAppBar {
  static CustomAppBar instance = CustomAppBar();
  PreferredSizeWidget getNamedDefault(BuildContext context,String routeName,Widget additionals){
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 35,
      backgroundColor: AppController.instance.mainColor,
      title: Row(

        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, routeName);
            },
            child: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 40.0,
            ),
          ),
          additionals
        ],
      ),
    );
  }

  PreferredSizeWidget getDefault(BuildContext context, String routeName){
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 35,
      backgroundColor: AppController.instance.mainColor,
      title: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, routeName);
            },
            child: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 40.0,
            ),
          ),

        ],
      ),
    );
  }
}