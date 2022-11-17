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
              width: 0,
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
              child: Text(widget.title,style: TextStyle(fontSize: 30,color: Colors.black),),
            ),
          ),
    );
  }
}




class CustomAppBar {
  static CustomAppBar instance = CustomAppBar();
  PreferredSizeWidget getNamedDefault(BuildContext context,String routeName,Widget additionals){
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 40,
      backgroundColor: AppController.instance.mainColor,
      centerTitle: true,
        leading: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Icon(
          Icons.arrow_circle_left_rounded,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 35.0,
        ),
      ),
      title: additionals
    );
  }

  PreferredSizeWidget getDefault(BuildContext context, String routeName){
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 40,
      backgroundColor: AppController.instance.mainColor,
      title: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, routeName);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 35.0,
            ),
          ),

        ],
      ),
    );
  }

  PreferredSizeWidget actionDefault(BuildContext context,String routeName,Widget additionals,Widget action){
    return AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 40,
        backgroundColor: AppController.instance.mainColor,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Icon(
            Icons.arrow_circle_left_rounded,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 35.0,
          ),
        ),
        title: additionals,
        actions: [action],
    );
  }

}