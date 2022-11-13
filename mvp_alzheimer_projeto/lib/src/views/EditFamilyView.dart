import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/models/FamilyModel.dart';

import '../components/AddFamilyComponents.dart';
import '../components/CustomButton.dart';
import '../components/EditFamilyComponetes.dart';
import '../controller/EditFamilyController.dart';

class EditFamilyView extends StatefulWidget {
  const EditFamilyView({Key? key}) : super(key: key);

  @override
  EditFamilyViewState createState() => EditFamilyViewState();
}

class EditFamilyViewState extends State<EditFamilyView> {
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
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Family>;
    TextEditingController titleController = new TextEditingController();
    TextEditingController descController = new TextEditingController();
    TextEditingController Telephone = new TextEditingController();
    DateTime dateController = DateTime.now();
    String imageLink;

    titleController.text = args["family"]!.getTitle();
    dateController = args["family"]!.getDate();
    descController.text = args["family"]!.getDescription();
    imageLink = args['family']!.imgLink ?? "assets/images/imagemEscolha.png";
    print("Modify: " + args['family']!.getIdentifier().toString());
    Telephone.text = args['family']!.getTelephone();


    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(context, "/family",Text('Editar',style: TextStyle(color: Colors.black),),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 10,
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
                imageLink: imageLink,
                response: () async {
                  //imageLink =  await AppController.instance.getImage().then((value) => imageLink = value);
                  Navigator.of(context).pushNamed('/editFamily', arguments: {
                    'family': new Family(
                        title: titleController.text,
                        Telephone: Telephone.text,
                        date: dateController,
                        parentesco: descController.text,
                        identifier: args['family']!.getIdentifier(),
                        image: FileImage(File(imageLink)),
                        imgLink: imageLink),
                  });
                },
              ),
            ),
            
            Container(
              height: 1,
                    decoration: BoxDecoration(
                      
                      color: Colors.lightBlue,
                      border: Border.all(),
                    ),
                  ),
            BorderedTextField(
              title: 'Nome: ',
              haveFrame: false,
              myResult: titleController,
            ),
            DateBorderedField(
              initialValue: dateController,
              onChangeFunction: (DateTime date) {
                dateController = date;
              },
              lastDate: dateController,
            ),
            BorderedTextField(
              title: "Telefone: ",
              haveFrame: false,
              myResult: Telephone,
            ),
            BorderedTextField(
              title: 'Parentesco: ',
              haveFrame: false,
              myResult: descController,
            ),
            Container(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  title: "Salvar",
                  color: Colors.green,
                  response: () async {
                    if (titleController.text == "" ||
                        descController.text == "") {
                      print("Preencha");
                    } else {
                      bool imgExists = false;
                      await File(imageLink)
                          .exists()
                          .then((value) => imgExists = value);
                      ImageProvider<Object>? finalImg = ((imgExists)
                              ? FileImage(File(imageLink))
                              : AssetImage("assets/images/imagemEscolha.png"))
                          as ImageProvider<Object>?;
                      EditFamilyController.instance.changeById(
                          args["family"]!.getIdentifier(),
                          Family(
                              title: titleController.text,
                              date: dateController,
                              Telephone: Telephone.text,
                              parentesco: descController.text,
                              identifier: args["family"]!.getIdentifier(),
                              image: finalImg ??
                                  AssetImage("assets/images/imagemEscolha.png"),
                              imgLink: (imgExists)
                                  ? imageLink
                                  : "assets/images/imagemEscolha.png"));
                      Navigator.of(context)
                          .pushNamed('/family', arguments: {});
                    }
                  },
                ),
                Container(
                  width: 10,
                ),
                CustomButton(
                  title: "Apagar",
                  color: Colors.red,
                  response: () {
                    EditFamilyController.instance
                        .excludeById(args["family"]!.getIdentifier());
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
