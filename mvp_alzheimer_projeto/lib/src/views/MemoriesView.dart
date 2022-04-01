import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../models/MemoryModel.dart';

class MemoriesView extends StatefulWidget {
  String var1 = "Festa Aniversario";
  String var2 = "Pele";
  String var3 = "05/10/2001";

  MemoriesView({Key? key}) : super(key: key);

  @override
  State<MemoriesView> createState() => MemoriesViewState();

}
class MemoriesViewState extends State<MemoriesView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Center(child: Text("Memorias",)),
      ),

      body: ListView.builder(
          itemCount: MemoryModel.instance.memories.length,
          itemBuilder: (BuildContext build,int index) {

            return Card(
                color: Colors.grey[400],
                child: InkWell(
                  splashColor: Colors.grey.withAlpha(70),
                  onTap: () {
                    Navigator.of(context).pushNamed('/seeMemory');
                  },
                  child:  SizedBox(
                    height: 160,
                    child: Row(

                      children: [
                        Image(image: AssetImage('assets/images/pelezin.jpg'),height: 120,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BorderedText(
                                  strokeColor: Colors.brown,
                                  strokeWidth: 3,
                                  child: Text(
                                    "Almoco em familia $index",
                                    style: TextStyle(fontSize: 20),
                                  )
                              ),
                              BorderedText(
                                  strokeColor: Colors.white,
                                  strokeWidth: 1.3,
                                  child: Text(
                                    "05/10/2001",
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
          print("Add new Memory!");
        setState(() {
          MemoryModel.instance.memories.add(Memory(title: "CU",date: DateTime.now()));
        });
        },
        child: Icon(Icons.add),
      ),
    );
  }



}
