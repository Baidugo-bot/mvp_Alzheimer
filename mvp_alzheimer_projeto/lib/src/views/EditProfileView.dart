import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/components/CustomInputs.dart';
import 'package:projeto_estudo/src/controller/ProfileController.dart';
import 'package:image_picker/image_picker.dart';

import '../../AppController.dart';
import '../components/AddFamilyComponents.dart';
import '../components/CustomButton.dart';
import '../components/EditMemoryComponents.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {



  @override
  Widget build(BuildContext context) {
    var args ;
    TextEditingController nomeController = new TextEditingController();
    ImageProvider<Object> imageController ;
    String imageLink = "assets/images/imagemEscolha.png";
    DateTime dateController = DateTime.now();

    nomeController.text =  ProfileController.instance.nome;
    imageLink = ProfileController.instance.imageLink;
    dateController = ProfileController.instance.dataNasc;
    print(ProfileController.instance.dataNasc);
    if(ModalRoute.of(context)!.settings.arguments != null){
      args = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
      nomeController.text = (args['nome']!=null)?args['nome'].toString():"";
      dateController = (args['data']!=DateTime.now())?DateTime.parse(args['data'].toString()):DateTime.now();
      imageLink = (args['imageLink']!=null)?args['imageLink'].toString():"";
    }
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(context,"/",Text(" Editar Perfil ",style: TextStyle(color: Colors.black),)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                  Navigator.of(context).pushNamed('/editProfile', arguments: {
                    'nome':nomeController.text,
                    'data':dateController.toString(),
                    'imageLink':imageLink.toString(),
                  });
                },
              ),
            ),
//container pega imagen
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: 430,
              decoration: BoxDecoration(
                border: Border(),
              ),
            ),
            Text(
              "Escolha uma imagem da galeria",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            // //ImagePickerContainer(
            //     imageController: ProfileController.instance.image),

//campo nome do usuario
            DefaultTextField(title: "Nome:", myResult: nomeController),
//campo calendario nacimento
            DateBorderedField(onChangeFunction: (date){
              dateController = date;
            }, lastDate: DateTime.now(), initialValue: ProfileController.instance.dataNasc,),
//função salvar
            Container(
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async{
                                      bool imgExists=false;
                                      await File(imageLink).exists().then((value) =>imgExists=value);
                                      ImageProvider<Object>? finalImg = ((imgExists)?FileImage(File(imageLink)):AssetImage("assets/images/imagemEscolha.png")) as ImageProvider<Object>?;
                                      ProfileController.instance.nome = nomeController.text;
                                      ProfileController.instance.dataNasc = dateController;
                                      ProfileController.instance.image = finalImg ?? AssetImage("assets/images/imagemEscolha.png");
                                      Navigator.pushNamed(context, '/profile');
                                    },
                                    child: Text('SALVAR'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.grey,
                                      side: BorderSide(
                                        width: 1.0,
                                        
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
          ],
        ),
      ),
    );
  }

  RaisedButton(
      {required Text child,
      required Color color,
      required void Function() onPressed}) {}
}
//  _getFromGallery()  {
    
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }
