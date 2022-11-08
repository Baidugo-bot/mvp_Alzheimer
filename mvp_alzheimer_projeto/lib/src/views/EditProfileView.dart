import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/controller/ProfileController.dart';
import 'package:projeto_estudo/src/components/ProfileComponents.dart';
import 'package:image_picker/image_picker.dart';

import '../../AppController.dart';

import '../components/CustomButton.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  TextEditingController txtNome = TextEditingController();
  DateTime dataController = DateTime.now();
   String imageLink = "assets/images/imagemEscolha.png";

  void Salvar() {
    String nome;
    int data;

    setState(() {
      ProfileController.instance.nome = txtNome.text;
      ProfileController.instance.dataNasc = dataController;
      ProfileController.instance.image =
          ProfileController.instance.imagemTemporaria;
      Navigator.pushNamed(context, '/profile');
    });
  }

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
 
    var args ;
if(ModalRoute.of(context)!.settings.arguments != null){
     
      imageLink = (args['imageLink']!=null)?args['imageLink'].toString():"";
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(121,188,218, 1),
      appBar:
          CustomAppBar.instance.getNamedDefault(context, "/profile", Text('Editar Perfil')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//container pega imagen
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
                  Navigator.of(context).pushNamed('/profile', arguments: {
                 
                    'imageLink': imageLink,
                    
                  });
                },
              ),
            ),
            Text(
              "Escolha uma imagem da galeria",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
//campo nome do usuario
            TextField(
              controller: txtNome,
              decoration: InputDecoration(
                  labelText: 'Nome',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder()),
            ),
//campo calendario nacimento
            DateBorderedField(
              onChangeFunction: (DateTime date) {
                dataController = date;
              },
            ),
//função salvar
            Container(
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                       Salvar();
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
