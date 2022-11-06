import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';
import 'package:projeto_estudo/src/controller/EditMemoryController.dart';
import 'package:projeto_estudo/src/controller/FamilyController.dart';

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
    TextEditingController nomeController = new TextEditingController();
    TextEditingController parentescoController = new TextEditingController();
    TextEditingController telefoneController = new TextEditingController();
    ImageProvider<Object> imageController ;
    String imageLink = "assets/images/imagemEscolha.png";
    DateTime dateController = DateTime.now();

    if(ModalRoute.of(context)!.settings.arguments != null){
      args = ModalRoute.of(context)!.settings.arguments as Map<String,Family>;
      nomeController.text = (args['family']!.title!=null)?args['nome'].toString():"";
      telefoneController.text = (args['family']!.Telephone!=null)?args['telefone'].toString():"";
      parentescoController.text = (args['family']!.parentesco!=null)?args['parentesco'].toString():"";
      dateController = (args['family']!.getDate()!=DateTime.now())?DateTime.parse(args['date'].toString()):DateTime.now();
      imageLink = (args['Family']!.imgLink!=null)?args['Family']!.imgLink:"";
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
                  Navigator.of(context).pushNamed('/editFamily', arguments: {
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
                  Navigator.of(context).pushNamed('/editMemory', arguments: {
                    'memory': new Memory(
                        title: nomeController.text,
                        date: dateController,
                        description: parentescoController.text,
                        identifier: args['memory']!.getIdentifier(),
                        image: FileImage(File(imageLink)),
                        imgLink: imageLink
                    ),

                  });
                },
              ),
            ),
            Container(
              height: 30,
            ),
            BorderedTextField(
              title: 'Titulo:',
              haveFrame: false,
              myResult: nomeController,

            ),
            DateBorderedField(
              initialValue: dateController,
              onChangeFunction: (DateTime date){dateController = date;},
              lastDate: dateController,
            ),
            BorderedTextField(
              title: "Anotacoes:",
              haveFrame: true,
              myResult: parentescoController,
            ),
            Container(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  title: "Salvar",
                  color: Colors.green,
                  response: () async {
                    if(nomeController.text=="" || parentescoController.text==""){
                      print("Preencha");
                    }else{

                      bool imgExists = false;
                      await File(imageLink).exists().then((value) =>imgExists=value);
                      ImageProvider<Object>? finalImg = ((imgExists)?FileImage(File(imageLink)):AssetImage("assets/images/imagemEscolha.png")) as ImageProvider<Object>?;
                      FamilyController.instance.changeById(args["family"]!.getIdentifier(),
                            Family(
                                title: nomeController.text,
                                date: dateController,
                                parentesco: parentescoController.text,
                                identifier: args["memory"]!.getIdentifier(),
                                image: finalImg ?? AssetImage("assets/images/imagemEscolha.png"),
                                imgLink: (imgExists)?imageLink:"assets/images/imagemEscolha.png",
                                Telephone: telefoneController.text
                            ));
                        Navigator.of(context).pushNamed('/memories', arguments: {});
                    }
                  },
                ),
                Container(width: 10,),
                CustomButton(
                  title: "Apagar",
                  color: Colors.red,
                  response: (){
                    FamilyController.instance.excludeById(args["family"]!.getIdentifier());
                    Navigator.of(context).pushNamed('/family', arguments: {});
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
