import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/models/FamilyModel.dart';
import '../components/AddFamilyComponents.dart';
import '../components/CustomButton.dart';
import '../components/EditMemoryComponents.dart';
import '../controller/EditFamilyController.dart';
import '../controller/SessionController.dart';

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
              dateTime: false,
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
                      ImageProvider<Object>? finalImg = ((imgExists)
                              ? FileImage(File(imageLink))
                              : AssetImage("assets/images/imagemEscolha.png"))
                          as ImageProvider<Object>?;
                      Family usedFamily = Family(
                          title: titleController.text,
                          date: dateController,
                          Telephone: Telephone.text,
                          parentesco: descController.text,
                          identifier: args["family"]!.getIdentifier(),
                          idBanco: args["family"]!.idBanco,
                          image: finalImg ??
                              AssetImage("assets/images/imagemEscolha.png"),
                          imgLink: (imgExists)
                              ? imageLink
                              : "assets/images/imagemEscolha.png");
                      SessionController.instance.editFamily(usedFamily).then((value) => (){});
                      Future.delayed(const Duration(seconds: 1), () {

// Here you can write your code
                        SessionController.instance.getFamily().then((value) =>Navigator.of(context).pushNamed('/family'));;
                        setState(() {

                        });

                      });

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
                    SessionController.instance.removeFamily(args["family"]!.idBanco ?? -1).then((value) => (){

                    });
                    Future.delayed(const Duration(seconds: 1), () {

// Here you can write your code
                      SessionController.instance.getFamily().then((value) =>Navigator.of(context).pushNamed('/family'));
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
