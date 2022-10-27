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
  TextEditingController txtTelephone = TextEditingController();
  DateTime dataController = DateTime.now();

  void Salvar() {
    String nome;
    String parentesco;
    int data;
    int Telephone;

    setState(() {
      FamilyController.instance.nome = txtNome.text;
      FamilyController.instance.parentesco = txtParentesco.text;
      //FamilyController.instance.Telephone = int.parse(txtTelephone.text);
      FamilyController.instance.dataNasc = dataController;
      FamilyController.instance.image =
          FamilyController.instance.imagemTemporaria;
      FamilyModel.instance.family.add(new Family(
        title: txtNome.text,
        date: dataController,
        Telephone: int.parse(txtTelephone.text),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlue,
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
                color: Colors.white,
                size: 40.0,
              ),
            ),
            Text(
              " Familiares",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
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
                decoration: BoxDecoration(color: Colors.lightBlue),
                height: MediaQuery.of(context).size.height - 90,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.lightBlue),
                        // height: MediaQuery.of(context).size.height - 150,
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
                              height: 30,
                            ),
                            // ImagePickerContainer(
                            //     imageController: FamilyController.instance.image),

//campo nome do usuario
                            TextField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              controller: txtNome,
                              decoration: InputDecoration(
                                hintText: 'Nome: ',
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                              ),
                            ),
//campo calendario nacimento

                            Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                              ),
                              child: DateBorderedField(
                                onChangeFunction: (DateTime date) {
                                  dataController = date;
                                },
                              ),
                            ),

//campo nome do Parentesco
                            TextField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              controller: txtParentesco,
                              decoration: InputDecoration(
                                hintText: 'Parentesco: ',
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                              ),
                            ),

//campo telefone
                            TextField(
                              controller: txtTelephone,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Telefone: ',
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black),
                                ),
                              ),
                            ),
//função salvar
                            Container(
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                       Salvar();
                                      Navigator.pushNamed(context, '/family');
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
