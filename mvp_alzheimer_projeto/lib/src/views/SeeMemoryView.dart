import 'package:flutter/material.dart';

import '../models/MemoryModel.dart';

class SeeMemoryView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String,Memory>;

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("Ver memoria"),
        actions: [
          InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('/editMemory',arguments: {});
              },
              splashColor: Colors.blue,
              child: Icon(Icons.edit)

          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 30,),
              Image(image: AssetImage('assets/images/pelezin.jpg'),),
              Container(height: 30,),
              Container(
                color: Colors.black,
                width: 500,
                child: Center(child: Text(args["memory"]!.getTitle(), style: TextStyle(fontSize: 40, color: Colors.white))),
              ),
              Container(
                color: Colors.black,
                width: 500,
                child: Center(child: Text(args["memory"]!.getDate().toString().substring(0,10), style: TextStyle(fontSize: 40, color: Colors.white))),
              ),


              Container(
                height: 195,
                color: Colors.black45,
                child: Text(args["memory"]!.getDescription(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
