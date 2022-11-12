import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/CustomButton.dart';
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
    var args ;
    TextEditingController titleController = new TextEditingController();
    TextEditingController descController = new TextEditingController();
    ImageProvider<Object> imageController ;
    String imageLink = "assets/images/imagemEscolha.png";
    DateTime dateController = DateTime.now();

    if(ModalRoute.of(context)!.settings.arguments != null){
      args = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
      titleController.text = (args['title']!=null)?args['title'].toString():"";
      descController.text = (args['desc']!=null)?args['desc'].toString():"";
      dateController = (args['date']!=DateTime.now())?DateTime.parse(args['date'].toString()):DateTime.now();
      imageLink = (args['imageLink']!=null)?args['imageLink'].toString():"";
    }
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(context, "/memories", Text("Adicionar Memória",style: TextStyle(color: Colors.black),)),
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
                  bottom: BorderSide(width: 2, color: Colors.black),
                ),
              ),
              child: ImagePickerContainer(
                  imageLink : imageLink,
                  response: () async {
                      imageLink =  await AppController.instance.getImage().then((value) => imageLink = value);
                      Navigator.of(context).pushNamed('/addMemory', arguments: {'title':titleController.text, 'date': dateController.toString(),'desc':descController.text, 'imageLink': imageLink, 'identifier': MemoryModel.instance.memories.length.toString()});
                      },
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
            DateBorderedField(
              initialValue: dateController,
              lastDate: dateController,
              onChangeFunction: (DateTime date){
                dateController = date;
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
              response: () async {
                if(titleController.text=="" || descController.text==""){
                  print("Preencha");
                }else{
                  print(dateController);
                  bool imgExists = false;
                  int memCount = MemoryModel.instance.memories.length;
                  await File(imageLink).exists().then((value) =>imgExists=value);
                  ImageProvider<Object>? finalImg = ((imgExists)?FileImage(File(imageLink)):AssetImage("assets/images/imagemEscolha.png")) as ImageProvider<Object>?;
                  print(MemoryModel.instance.memories.length);
                  MemoryModel.instance.memories.add(new Memory(
                      title: titleController.text,
                      date: dateController,
                      description: descController.text,
                      identifier: memCount,
                      image: finalImg ?? AssetImage("assets/images/imagemEscolha.png"),
                      imgLink: (imgExists)?imageLink:"assets/images/imagemEscolha.png"
                  ));
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
