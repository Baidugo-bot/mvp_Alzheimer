import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/controller/FamilyController.dart';
import 'package:projeto_estudo/src/components/FamilyComponents.dart';

import '../components/AddFamilyComponents.dart';
import '../components/CustomButton.dart';
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

  get imageController => null;

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
      ImageProvider<Object> imageController =
          AssetImage("assets/images/imagemEscolha.png");
      FamilyModel.instance.famili.add(new Family(
        title: txtNome.text,
        date: dataController,
        identifier: FamilyModel.instance.famili.length,
        parentesco: '',
        image: imageController,
        Telephone: (txtTelephone.text),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    print(imageController);
    return Scaffold(
      // backgroundColor: Colors.lightBlue,
     appBar: CustomAppBar.instance.getNamedDefault(context, "/family",Center(child: Text('Cadastro'))),

      body: Column(
        children: [
          Container(
            height: 1,
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            decoration:
                BoxDecoration(border: Border.all(), color: Color.fromRGBO(121,188,218, 1)),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  width: 430,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2, color: Colors.grey),
                    ),
                  ),
                  //child: ImagePickerContainer(imageController: imageController),
                ),
                Container(
                  height: 10,
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromRGBO(121,188,218, 1),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Container(
                    decoration: BoxDecoration(color: Color.fromRGBO(121,188,218, 1)),
                    height: MediaQuery.of(context).size.height - 0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(),
                          child: Container(
                            decoration: BoxDecoration(color: Color.fromRGBO(121,188,218, 1)),
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
                                    color: Color.fromRGBO(121,188,218, 1),
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
                                    color: Color.fromRGBO(121,188,218, 1),
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
                                          Navigator.pushNamed(
                                              context, '/family');
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
        ],
      ),
    );
  }
}
