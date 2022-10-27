import 'package:flutter/material.dart';
import '../components/FamilyComponents.dart';
import '../controller/EditFamilyController.dart';
class EditFamilyView extends StatefulWidget {
  @override
  EditFamilyViewState createState() => EditFamilyViewState();
}

class EditFamilyViewState extends State<EditFamilyView> {
  TextEditingController txtNome = TextEditingController();
  DateTime dataController = DateTime.now();

  void Salvar() {
    String nome;
    int data;

    setState(() {
      EditFamilyController.instance.nome = txtNome.text;
      EditFamilyController.instance.dataNasc = dataController;
      EditFamilyController.instance.image =
          EditFamilyController.instance.imagemTemporaria;
      Navigator.pushNamed(context, '/editprofile');
    });
  }

  @override
  Widget build(BuildContext context) {
    // final ImagePicker picker = ImagePicker();
    // XFile? Img;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
//botão volta menu principal
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/family');
              },
              child: Icon(
                Icons.keyboard_return,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 40.0,
              ),
            ),
            Text(
              " Eitar Familiar",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
//botão add perfil
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(null), onPressed: () {}),
                ]),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
              "Escolha uma imagem da galeria",
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
            Column(
              children: [
              InkWell(
                child: Text(
                  "salvar",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                // color: Color.fromARGB(255, 19, 117, 121),
                // onPressed: Salvar),
                onTap: () {
                  Salvar();
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              ],
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
