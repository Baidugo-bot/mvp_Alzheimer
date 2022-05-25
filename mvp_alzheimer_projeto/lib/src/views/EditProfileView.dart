import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/ProfileComponents.dart';
import '../components/EditProfileComponents.dart';
import 'package:image_picker/image_picker.dart';
import '';

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
      AppController.instance.profile.image = imageController ;
      print (AppController.instance.profile.image);
      Navigator.pushNamed(context, '/profile');
    });
  }

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    XFile? Img;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Pagina "),
        actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: Icon(
              Icons.keyboard_return,
              color: Colors.red,
              size: 30.0,
            ),
          )
      ]
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),color: Colors.black12,
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
              child: ImagePickerContainer(imageController : imageController),
            ),
            Text("This is pelezin from brazil"),
//campo nome do usuario            
            TextField(
              controller: txtNome,
              decoration: InputDecoration(
                  labelText: 'Nome', hintStyle: TextStyle(color: Colors.black),border: OutlineInputBorder()
              ),
            ),
//campo calendario nacimento
            DateBorderedField(
              onChangeFunction: (DateTime date){
                dataController = date;
              },
            ),
//campo data
            // TextField(
            //  keyboardType: TextInputType.datetime,
            //   decoration: InputDecoration(
            //       labelText: 'Idade', hintStyle: TextStyle(color: Colors.black),border: OutlineInputBorder()),
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
