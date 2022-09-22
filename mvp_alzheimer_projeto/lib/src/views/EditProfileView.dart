import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/controller/ProfileController.dart';
import 'package:projeto_estudo/src/components/ProfileComponents.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  TextEditingController txtNome = TextEditingController();
  DateTime dataController = DateTime.now();

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
    XFile? Img;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
//botão volta menu principal
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Icon(
                Icons.keyboard_return,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 50.0,
              ),
            ),
            Text(" Editar Perfil"),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//container pega imagen
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: 430,
              decoration: BoxDecoration(
                border: Border(),
              ),
            ),
            Text(
              "Escolha uma imagen da galeria",
              style: TextStyle(
                fontSize: 24,
               
              ),
            ),
            // //ImagePickerContainer(
            //     imageController: ProfileController.instance.image),

//campo nome do usuario
            TextField(
              controller: txtNome,
              decoration: InputDecoration(
                  labelText: 'Nome',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder()),
            ),
//campo calendario nacimento
            DateBorderedField(
              onChangeFunction: (DateTime date) {
                dataController = date;
              },
            ),
//campo data
            // TextField(
            //   keyboardType: TextInputType.datetime,
            //   decoration: InputDecoration(
            //       labelText: 'Idade',
            //       hintStyle: TextStyle(color: Colors.black),
            //       border: OutlineInputBorder()),
            // ),
//função salvar
            RaisedButton(
                child: Text(
                  "salvar",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                color: Color.fromARGB(255, 19, 117, 121),
                onPressed: Salvar),
          ],
        ),
      ),
    );
  }
}
//  _getFromGallery()  {
    
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }
