import 'package:bordered_text/bordered_text.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';

import '../components/AddMemoryComponents.dart';
import '../models/MemoryModel.dart';

class AddMemoryView extends StatefulWidget {
  const AddMemoryView({Key? key}) : super(key: key);

  @override
  AddMemoryViewState createState() => AddMemoryViewState();
}

class AddMemoryViewState extends State<AddMemoryView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = new TextEditingController();
    TextEditingController descController = new TextEditingController();
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: Center(child: Text("Add Memory")),
        actions: [
          InkWell(
              onTap: () {
                MemoryModel.instance.memories.add(new Memory(title: titleController.text, date: DateTime.now(), description: descController.text, identifier: MemoryModel.instance.memories.length));
                Navigator.of(context).pushNamed('/memories', arguments: {});
              },
              splashColor: Colors.blue,
              child: Icon(Icons.check)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: 430,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2, color: Colors.grey),
                ),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Image(
                  image: AssetImage(
                    'assets/images/pelezin.jpg',
                  ),
                  height: 250,
                ),
              ),
            ),
            Container(
              height: 30,
            ),
            BorderedTextField(
              title: 'Titulo:',
              haveFrame: false,
              myResult: titleController,
            ),
            DateBorderedField(),
            BorderedTextField(
              title: "Anotacoes:",
              haveFrame: true,
              myResult: descController,
            ),
            Container(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(),
                Container(width: 10,),
                CustomButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
