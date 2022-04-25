import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../AppController.dart';
import '../models/MemoryModel.dart';

class SeeMemoryView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String,Memory>;
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: Text("Ver memoria"),
        actions: [
          InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('/editMemory',arguments: { "memory": args["memory"] as Memory});
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
              Container(height: 15,),
              Image(image: AssetImage('assets/images/pelezin.jpg'),height: 200,),
              Container(height: 10,),
              Container(
                width: 500,
                child: Center(
                    child: BorderedText(
                      strokeColor: Colors.brown,
                      strokeWidth: 3,
                      child: Text(
                          args["memory"]!.getTitle().toUpperCase()+args["memory"]!.getIdentifier().toString(),
                          style: TextStyle(fontSize: 25, color: Colors.white,)
                      ),
                    )
                ),
              ),
              Container(
                width: 500,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 2,color: Colors.lightBlue
                      ),
                    ),
                ),
                child: Center(
                    child: BorderedText(
                      strokeColor: Colors.lightBlue,
                      strokeWidth: 3,

                      child: Text(
                          Jiffy(AppController.instance.now).EEEE.toString()+" "+args["memory"]!.getDate().toString().substring(0,10),
                          style: TextStyle(fontSize: 25, color: Colors.white)
                      ),
                    )
                ),
              ),


              Container(
                height: 150,
                width: 415,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 16.0,color: Color.fromRGBO(158, 158, 158, 0)  ),
                    right: BorderSide(width: 16.0,color: Color.fromRGBO(158, 158, 158, 0) ),
                  ),
                ),

                child: BorderedText(
                  strokeWidth: 3,
                  strokeColor: Colors.black,
                  child: Text(
                      args["memory"]!.getDescription().toUpperCase(),
                      style: TextStyle(fontSize: 20, color: Colors.white)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
