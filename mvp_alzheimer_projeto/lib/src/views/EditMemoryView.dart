import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';
import 'package:projeto_estudo/src/controller/EditMemoryController.dart';
import 'package:projeto_estudo/src/controller/FamilyController.dart';
import 'package:projeto_estudo/src/controller/SessionController.dart';

import '../components/AddMemoryComponents.dart';
import '../components/CustomButton.dart';
import '../models/FamilyModel.dart';
import '../models/MemoryModel.dart';
class EditMemoryView extends StatefulWidget {
  const EditMemoryView({Key? key}) : super(key: key);

  @override
  EditMemoryViewState createState() => EditMemoryViewState();
}

class EditMemoryViewState extends State<EditMemoryView> {
  /*
  *  new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
  * */
  @override
  Widget build(BuildContext context) {
    var args ;
    TextEditingController titleController = new TextEditingController();
    TextEditingController descController = new TextEditingController();
    ImageProvider<Object> imageController ;
    String imageLink = "assets/images/imagemEscolha.png";
    DateTime dateController = DateTime.now();

    if(ModalRoute.of(context)!.settings.arguments != null){
      args = ModalRoute.of(context)!.settings.arguments as Map<String,Memory>;
      titleController.text = (args['memory']!.title!=null)?args['memory'].title:"";
      descController.text = (args['memory']!.description!=null)?args['memory'].description:"";
      dateController = args['memory'].getDate()!=DateTime.now()?args['memory'].getDate():DateTime.now();
      imageLink = (args['memory']!.imgLink!=null)?args['memory']!.imgLink:"";
    }
    return Scaffold(

      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getDefault(context,"/memories"),
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
              initialValue: dateController,
              onChangeFunction: (DateTime date){dateController = date;},
              lastDate: dateController,
            ),
            BorderedTextField(
              title: "Anotacoes:",
              haveFrame: true,
              myResult: descController,
            ),
            Container(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  title: "Salvar",
                  color: Colors.green,
                  response: () async {
                    if(titleController.text=="" || descController.text==""){
                      print("Preencha");
                    }else{
                      bool imgExists = false;
                      await File(imageLink).exists().then((value) =>imgExists=value);
                      ImageProvider<Object>? finalImg = ((imgExists)?FileImage(File(imageLink)):AssetImage("assets/images/imagemEscolha.png")) as ImageProvider<Object>?;
                      Memory usedMemory = Memory(
                          title: titleController.text,
                          date: dateController,
                          identifier: args["memory"]!.getIdentifier(),
                          image: finalImg ?? AssetImage("assets/images/imagemEscolha.png"),
                          imgLink: (imgExists)?imageLink:"assets/images/imagemEscolha.png",
                          description: descController.text,
                          idBanco: args["memory"]!.idBanco
                      );
                      SessionController.instance.editMemory(usedMemory).then((value) => null);

                      Future.delayed(const Duration(seconds: 1), () {
                        SessionController.instance.getMemories().then((value) =>  Navigator.of(context).pushNamed('/memories', arguments: {}));
                        setState(() {

                        });
                      });
                    }
                  },
                ),
                Container(width: 10,),
                CustomButton(
                  title: "Apagar",
                  color: Colors.red,
                  response: (){
                    SessionController.instance.removeMemory(args["memory"]!.idBanco).then((value) =>
                    {
                    });
                    Future.delayed(const Duration(seconds: 1), () {
                      SessionController.instance.getMemories().then((value) =>  Navigator.of(context).pushNamed('/memories', arguments: {}));
                      setState(() {

                      });
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
