import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';
import 'package:projeto_estudo/src/controller/EditMemoryController.dart';

import '../components/AddMemoryComponents.dart';
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
    var args = ModalRoute.of(context)!.settings.arguments as Map<String,Memory>;
    TextEditingController titleController = new TextEditingController();
    TextEditingController descController = new TextEditingController();
    DateTime dateController = DateTime.now() ;
    String imageLink = "assets/images/imagemEscolha.png";

    titleController.text = args["memory"]!.getTitle();
    dateController = args["memory"]!.getDate();
    descController.text = args["memory"]!.getDescription();

    if(ModalRoute.of(context)!.settings.arguments != null){
      args = ModalRoute.of(context)!.settings.arguments as Map<String,Memory>;
      titleController.text = (args['title']!=null)?args['title'].toString():"";
      descController.text = (args['desc']!=null)?args['desc'].toString():"";
      dateController = (args['date']!=DateTime.now())?DateTime.parse(args['date'].toString()):DateTime.now();
      imageLink = (args['imageLink']!=null)?args['imageLink'].toString():"";
      print(titleController.text);
      print(descController.text);
      print(dateController.toString());
    }
    /*
    * new Memory(
                      title: titleController.text,
                      date: dateController,
                      description: descController.text,
                      identifier: MemoryModel.instance.memories.length,
                      image: FileImage(File(imageLink)))*/

    return Scaffold(

      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        backgroundColor: AppController.instance.mainColor,
        title: Center(child: Text("Edit Memory")),


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
                  Navigator.of(context).pushNamed('/addMemory', arguments: {
                    'memory': new Memory(
                        title: titleController.text,
                        date: dateController,
                        description: descController.text,
                        identifier: MemoryModel.instance.memories.length,
                        image: FileImage(File(imageLink)))
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
              myResult: titleController,

            ),
            DateBorderedField(
              onChangeFunction: (DateTime date){dateController = date;},
              initialDate: dateController,
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
                  response: (){
                    if(titleController.text=="" || descController.text==""){
                      print("Preencha");
                    }else{

                        EditMemoryController.instance.changeById(args["memory"]!.getIdentifier(),
                            Memory(
                                title: titleController.text,
                                date: dateController,
                                description: descController.text,
                                identifier: args["memory"]!.getIdentifier(),
                                image: args["memory"]!.getImage(),
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
                    EditMemoryController.instance.excludeById(args["memory"]!.getIdentifier());
                    Navigator.of(context).pushNamed('/memories', arguments: {});
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
