import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/CustomButton.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';

import '../components/AddMemoryComponents.dart';
import '../controller/SessionController.dart';
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
              height: 30,
            ),
            BorderedTextField(
              title: 'Titulo:',
              haveFrame: false,
              myResult: titleController,
            ),
            DateBorderedField(
              dateTime: true,
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
                if(titleController.text=="" || descController.text==""  ){
                  AppController.instance.messageResponse(context, "Campos precisam ser preenchidos!");
                }else{
                  print(dateController);
                  bool imgExists = false;
                  int memCount = MemoryModel.instance.memories.length;
                  await File(imageLink).exists().then((value) =>imgExists=value);
                  ImageProvider<Object>? finalImg = ((imgExists)?FileImage(File(imageLink)):AssetImage("assets/images/imagemEscolha.png")) as ImageProvider<Object>?;
                  print(MemoryModel.instance.memories.length);
                  Memory usedMemory = new Memory(
                      title: titleController.text,
                      date: dateController,
                      description: descController.text,
                      identifier: memCount,
                      image: finalImg ?? AssetImage("assets/images/imagemEscolha.png"),
                      imgLink: (imgExists)?imageLink:"assets/images/imagemEscolha.png"
                  );
                  SessionController.instance.registerMemory(usedMemory).then((value) =>{
                  });
                  Future.delayed(const Duration(seconds: 1), () {
                    AppController.instance.messageResponse(context, "Memoria registrada!");
                    SessionController.instance.getMemories().then((value) =>  Navigator.of(context).pushNamed('/memories', arguments: {}));
                    setState(() {
                    });
                  });


                  //Navigator.of(context).pushNamed('/memories', arguments: {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
