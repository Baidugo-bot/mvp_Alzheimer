import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    ImageProvider<Object> imageController = AssetImage("assets/images/imagemEscolha.png");
    DateTime dateController = DateTime.now();
    print(imageController);
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        backgroundColor: AppController.instance.mainColor,
        title: Center(child: Text("Add Memory")),
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
              child: ImagePickerContainer(imageController : imageController),
            ),
            Container(
              height: 30,
            ),
            BorderedTextField(
              title: 'Titulo:',
              haveFrame: false,
              myResult: titleController,
            ),
            DateBorderedField(
              onChangeFunction: (DateTime date){

              },
            ),
            BorderedTextField(
              title: "Anotacoes:",
              haveFrame: true,
              myResult: descController,
            ),
            Container(height: 10,),
            CustomButton(
              title: "Adicionar",
              color: Colors.green,
              response: (){
                if(titleController.text=="" || descController.text==""){
                  print("Preencha");
                }else{

                  MemoryModel.instance.memories.add(new Memory(
                      title: titleController.text, date: DateTime.now(),
                      description: descController.text,
                      identifier: MemoryModel.instance.memories.length,
                      image: imageController));
                  Navigator.of(context).pushNamed('/memories', arguments: {});
                }



              },
            ),
          ],
        ),
      ),
    );
  }
}
