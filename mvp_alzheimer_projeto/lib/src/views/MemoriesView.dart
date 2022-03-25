import 'package:flutter/material.dart';

import '../models/MemoryModel.dart';

class MemoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MemoryModel.instance.memories.add(Memory(title: "",date: DateTime.now()));
    return Scaffold(
      appBar: AppBar(
        title: Text("Memorias"),
      ),

      body: ListView.builder(
          itemCount: MemoryModel.instance.memories.length,
          itemBuilder: (BuildContext build,int index) {

            return Center(
                child:
            Container(
                width: double.infinity,
                height: 100,
                margin: EdgeInsets.only(bottom: 40 ),
                color: Colors.red,

                child:
            Text(index.toString())));
          }
      )
    );
  }
}
