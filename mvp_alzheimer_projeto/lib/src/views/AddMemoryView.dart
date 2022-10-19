import 'dart:io';

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
      print(titleController.text);
      print(descController.text);
      print(dateController.toString());
    }
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
              child: ImagePickerContainer(
                  imageLink : imageLink,
                  response: () async {
                      imageLink =  await AppController.instance.getImage().then((value) => imageLink = value);
                      Navigator.of(context).pushNamed('/addMemory', arguments: {'title':titleController.text, 'date': dateController.toString(),'desc':descController.text, 'imageLink': imageLink});
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
              initialDate: dateController,
              onChangeFunction: (DateTime date){
                dateController = date;
                print(date.toString());
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
                print("Cheggou, adicionar");
                if(titleController.text=="" || descController.text==""){
                  print("Preencha");
                }else{
                  ImageProvider<Object>? validatedIMGLink ;
                  File(imageLink).exists().then((value) =>
                  (value==true)?validatedIMGLink=FileImage(File(imageLink)):AssetImage("assets/images/imagemEscolha.png"));
                  MemoryModel.instance.memories.add(new Memory(
                      title: titleController.text,
                      date: dateController,
                      description: descController.text,
                      identifier: MemoryModel.instance.memories.length,
                      image: validatedIMGLink ?? AssetImage("assets/images/imagemEscolha.png")
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
