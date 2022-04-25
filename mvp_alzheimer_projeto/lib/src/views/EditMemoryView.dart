import 'package:bordered_text/bordered_text.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';

import '../components/AddMemoryComponents.dart';
import '../models/MemoryModel.dart';

class EditMemoryView extends StatefulWidget {
  const EditMemoryView({Key? key}) : super(key: key);

  @override
  EditMemoryViewState createState() => EditMemoryViewState();
}

class EditMemoryViewState extends State<EditMemoryView> {

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String,Memory>;
    TextEditingController titleController = new TextEditingController();
    TextEditingController descController = new TextEditingController();
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: Center(child: Text("Edit Memory")),
        actions: [
          InkWell(
              onTap: () {

                Navigator.of(context).pushNamed('/seeMemory', arguments: {});
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
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
