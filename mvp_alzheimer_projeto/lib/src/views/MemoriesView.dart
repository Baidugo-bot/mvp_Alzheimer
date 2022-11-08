import 'dart:io';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';

import '../components/CustomButton.dart';
import '../models/MemoryModel.dart';

class MemoriesView extends StatefulWidget {


  MemoriesView({Key? key}) : super(key: key);

  @override
  State<MemoriesView> createState() => MemoriesViewState();

}
class MemoriesViewState extends State<MemoriesView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(context,"/",Text(" Memorias ")),

      body: ListView.builder(
          itemCount: MemoryModel.instance.memories.length, // if 0 then show message
          itemBuilder: (BuildContext build,int index) {
            print("Sequencia :"+MemoryModel.instance.memories[index].identifier.toString());

            return Card(

                color: AppController.instance.mainColor,
                child: InkWell(
                  splashColor: Colors.grey.withAlpha(70),
                  onTap: () {
                    Navigator.of(context).pushNamed('/seeMemory',arguments: {"memory": MemoryModel.instance.memories[index]});
                  },
                  child:  SizedBox(
                    height: 160,
                    child: Row(

                      children: [
                        Image(
                          image: MemoryModel.instance.memories[index].getImage(),
                          height: 120,),
                        Container(width: 10,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BorderedText(
                                  strokeColor: Colors.brown,
                                  strokeWidth: 3,
                                  child: Text(
                                    MemoryModel.instance.memories[index].getTitle(),
                                    style: TextStyle(fontSize: 20),
                                  )
                              ),
                              BorderedText(
                                  strokeColor: Colors.white,
                                  strokeWidth: 1.3,
                                  child: Text(
                                    MemoryModel.instance.memories[index].getDate().toString().substring(0,10),
                                    style: TextStyle(fontSize: 20,color: Colors.black26),
                                  )
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,

        onPressed: (){
          Navigator.of(context).pushNamed('/addMemory');
        },
        child: Icon(Icons.add),
      ),
    );
  }



}
