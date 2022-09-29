import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/controller/FamilyController.dart';
import 'package:projeto_estudo/src/components/FamilyComponents.dart';
import 'package:image_picker/image_picker.dart';

import '../models/FamilyModel.dart';

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
      FamilyModel.instance.family
          .add(new Family(title: txtNome.text, date: dataController));
    });
  }

  @override
  Widget build(BuildContext context) {
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
              " Familiares",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 10,
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            color: Colors.lightBlue,
          ),
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: Colors.white),
              height: MediaQuery.of(context).size.height - 130,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white),
                      height: MediaQuery.of(context).size.height - 150,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                          ),
//container pega imagen
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              border: Border(),
                            ),
                            height:30,
                            
                          ),
                          // ImagePickerContainer(
                          //     imageController: FamilyController.instance.image),

//campo nome do usuario
                          TextField(
                            style: TextStyle(color: Colors.black,),
                            controller: txtNome,
                            decoration: InputDecoration(
                                labelText: 'Nome: ',
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder()),
                                

                          ),

//campo nome do Parentesco
                          TextField(
                            controller: txtParentesco,
                            decoration: InputDecoration(
                                labelText: 'Parentesco: ',
                                hintStyle: TextStyle(color: Colors.black),
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
                                labelText: 'Idade: ',
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder()),
                          ),
//função salvar
                          InkWell(
                            child: Text(
                              "salvar",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            // color: Color.fromARGB(255, 19, 117, 121),
                            // onPressed: Salvar),
                            onTap: () {
                              Salvar();
                              Navigator.pushNamed(context, '/family');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
