import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/ProfileComponents.dart';
import '../components/EditProfileComponents.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  TextEditingController txtNome = TextEditingController();
  DateTime dataController = DateTime.now(); 
  ImageProvider<Object> imageController = AssetImage("assets/images/pelezin.jpg");
  
  void Salvar() {
    String nome;
    int data;
    

    setState(() {
      AppController.instance.profile.nome = txtNome.text;
      AppController.instance.profile.dataNasc = dataController;
      AppController.instance.profile.image = imageController;
      Navigator.pushNamed(context, '/profile');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Pagina "),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImagePickerContainer(imageController: imageController),
            Text("This is pelezin from brazil"),
            
            TextField(
              controller: txtNome,
              decoration: InputDecoration(
                  labelText: 'Nome', hintStyle: TextStyle(color: Colors.black),border: OutlineInputBorder()),
            ),

            DateBorderedField(
              onChangeFunction: (DateTime date){
                dataController = date;
              },
            ),
            
            TextField(
             keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                  labelText: 'Idade', hintStyle: TextStyle(color: Colors.black),border: OutlineInputBorder()),
            ),

            RaisedButton(
                child: Text(
                  "salvar",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                color: Colors.blue,
                onPressed: Salvar),
          ],
        ),
      ),
    );
  }
}
