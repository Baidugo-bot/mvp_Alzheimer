import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/controller/FamilyController.dart';
import 'package:projeto_estudo/src/components/FamilyComponents.dart';
import 'package:image_picker/image_picker.dart';

class AddFamily extends StatefulWidget {
  @override
  State<AddFamily> createState() => AddFamilyState();
}

class AddFamilyState extends State<AddFamily> {
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtParentesco = TextEditingController();
  DateTime dataController = DateTime.now();

  void Salvar() {
    String nome;
    String parentesco;
    int data;


    setState(() {
      FamilyController.instance.nome = txtNome.text;
      FamilyController.instance.parentesco = txtParentesco.text;
      FamilyController.instance.dataNasc = dataController;
      FamilyController.instance.image =
          FamilyController.instance.imagemTemporaria;
      Navigator.pushNamed(context, '/Family');
    });
  }

  @override
  Widget build(BuildContext context) {
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
            Text(" Cadastrar Familiar"),
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
            // ImagePickerContainer(
            //     imageController: FamilyController.instance.image),

//campo nome do usuario
            TextField(
              controller: txtNome,
              decoration: InputDecoration(
                  labelText: 'Nome',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder()),
            ),

//campo nome do Parentesco
            TextField(
              controller: txtParentesco,
              decoration: InputDecoration(
                  labelText: 'Parentesco',
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
            
//campo telefone
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Idade',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder()),
            ),
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


