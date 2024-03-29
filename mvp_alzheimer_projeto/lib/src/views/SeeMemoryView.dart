import 'dart:io';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projeto_estudo/src/components/CustomButton.dart';

import '../../AppController.dart';
import '../models/MemoryModel.dart';

class SeeMemoryView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String,Memory>;
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,

      appBar: CustomAppBar.instance.actionDefault(context, "/memories", Text("Ver Memória",style: TextStyle(color: Colors.black),),
        InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('/editMemory',arguments: { "memory": args["memory"] as Memory});
            },
            splashColor: Colors.blue,
            child: Icon(Icons.edit)

        ),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 15,),
              Container(height: 10,),
              Container(
                width: 500,
                child: Center(
                    child: BorderedText(
                      strokeColor: Colors.black,
                      strokeWidth: 0,
                      child: Text(
                          args["memory"]!.getTitle().toUpperCase(),
                          style: const TextStyle(fontSize: 22, color: Colors.black,)
                      ),
                    )
                ),
              ),
              Container(
                width: 500,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,color: Colors.black45,
                      ),
                    ),
                ),
                child: Center(
                    child: BorderedText(
                      strokeColor: Colors.black,
                      strokeWidth: 0,

                      child: Text(
                          args["memory"]!.getConvertedDate().toString()+" "+args["memory"]!.date.toString().substring(10,16),
                          style: const TextStyle(fontSize: 25, color: Colors.black)
                      ),
                    )
                ),
              ),

              Container(height: 30,),
              Container(
                height: 200,
                width: 350,
                
                decoration: BoxDecoration(
                  color: Color.fromRGBO(228, 241, 247, 1),
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft:Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),

                child: BorderedText(
                  strokeWidth: 0,
                  strokeColor: Colors.black,
                  child: Text(
                      args["memory"]!.getDescription(),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 18, color: Colors.black,fontFamily: "Gidugu-Regular",height: 1.5)
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
