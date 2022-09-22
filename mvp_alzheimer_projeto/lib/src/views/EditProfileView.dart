import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/ProfileComponents.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  TextEditingController txtNome = TextEditingController();
  DateTime dataController = DateTime.now();
  ImageProvider<Object> imageController =
      AssetImage("assets/images/pelezin.jpg");

  void Salvar() {
    String nome;
    int data;

    setState(() {
      AppController.instance.profile.nome = txtNome.text;
      AppController.instance.profile.dataNasc = dataController;
      AppController.instance.profile.image = imageController;
      print(AppController.instance.profile.image);
      Navigator.pushNamed(context, '/profile');
    });
  }

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    XFile? Img;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: Icon(
              Icons.keyboard_return,
              color: Color.fromARGB(255, 12, 58, 184),
              size: 30.0,
            ),
          )
        ],
        title: Text("Editar Pagina "),
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
                border: Border(
                  bottom: BorderSide(width: 2, color: Colors.grey),
                ),
              ),
            ),
            ImagePickerContainer(imageController: imageController),
            Text("This is pelezin from brazil"),
//campo nome do usuario
            TextField(
              controller: txtNome,
              decoration: InputDecoration(
                  labelText: 'Nome',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 0, 255, 242)),
                  border: OutlineInputBorder()),
            ),
//campo calendario nacimento
            DateBorderedField(
              onChangeFunction: (DateTime date ) {
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
