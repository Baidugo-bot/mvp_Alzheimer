import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/CustomButton.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';
import 'package:projeto_estudo/src/controller/SessionController.dart';

import '../components/AddMemoryComponents.dart';
import '../models/FamilyModel.dart';
import '../models/MemoryModel.dart';

class AddFamily extends StatefulWidget {
  const AddFamily({Key? key}) : super(key: key);

  @override
  AddFamilyViewState createState() => AddFamilyViewState();
}

class AddFamilyViewState extends State<AddFamily> {
  @override
  Widget build(BuildContext context) {
    var args ;
    TextEditingController nomeController = new TextEditingController();
    TextEditingController parentescoController = new TextEditingController();
    TextEditingController telefoneController = new TextEditingController();
    ImageProvider<Object> imageController ;
    String imageLink = "assets/images/imagemEscolha.png";
    DateTime dateController = DateTime.now();

    if(ModalRoute.of(context)!.settings.arguments != null){
      args = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
      nomeController.text = (args['nome']!=null)?args['nome'].toString():"";
      telefoneController.text = (args['telefone']!=null)?args['telefone'].toString():"";
      parentescoController.text = (args['parentesco']!=null)?args['parentesco'].toString():"";
      dateController = (args['date']!=DateTime.now())?DateTime.parse(args['date'].toString()):DateTime.now();
      imageLink = (args['imageLink']!=null)?args['imageLink'].toString():"";
    }
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(context, '/family',Text("Adicionar Familiar",style: TextStyle(color: Colors.black),)),
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
                  Navigator.of(context).pushNamed('/addFamily', arguments: {
                    'nome':nomeController.text,
                    'date': dateController.toString(),
                    'parentesco':parentescoController.text,
                    'imageLink': imageLink,
                    'identifier': MemoryModel.instance.memories.length.toString(),
                    'telefone':telefoneController.text
                  });
                },
              ),
            ),
            BorderedTextField(
              title: 'nome:',
              haveFrame: false,
              myResult: nomeController,
            ),
            BorderedTextField(
              title: 'Parentesco:',
              haveFrame: false,
              myResult: parentescoController,
            ),
            DateBorderedField(
              dateTime: false,
              initialValue: dateController,
              lastDate: dateController,
              onChangeFunction: (DateTime date){
                dateController = date;
              },
            ),
            BorderedTextField(
              title: 'Telefone:',
              haveFrame: false,
              myResult: telefoneController,
            ),
            Container(height: 10,),
            CustomButton(
              title: "Adicionar",
              color: Colors.green,
              response: () async {
                if(nomeController.text=="" || parentescoController.text==""){
                  print("Preencha");
                }else{
                  bool imgExists = false;
                  int memCount = FamilyModel.instance.famili.length;
                  await File(imageLink).exists().then((value) =>imgExists=value);
                  ImageProvider<Object>? finalImg = ((imgExists)?FileImage(File(imageLink)):AssetImage("assets/images/imagemEscolha.png")) as ImageProvider<Object>?;
                  Family usedFamily = new Family(
                      title: nomeController.text,
                      date: dateController,
                      parentesco: parentescoController.text,
                      identifier: memCount,
                      image: finalImg ?? AssetImage("assets/images/imagemEscolha.png"),
                      imgLink: (imgExists)?imageLink:"assets/images/imagemEscolha.png",
                      Telephone: telefoneController.text
                  );
                  SessionController.instance.registerFamily(usedFamily).then((value) => (){});
                  SessionController.instance.getFamily().then((value) =>Navigator.of(context).pushNamed('/family'));;
                }



              },
            ),
          ],
        ),
      ),
    );
  }
}
