import 'package:flutter/material.dart';
import '../components/FamilyComponents.dart';
import '../controller/EditFamilyController.dart';
import '../models/FamilyModel.dart';
class EditFamilyView extends StatefulWidget {
  @override
  EditFamilyViewState createState() => EditFamilyViewState();
}

class EditFamilyViewState extends State<EditFamilyView> {
  TextEditingController txtNome = TextEditingController();
  DateTime dataController = DateTime.now();

  get txtParentesco => null;

  get txtTelephone => null;

  void Salvar() {
    String nome;
        String parentesco;
    int data;
    int Telephone;
    setState(() {
      EditFamilyController.instance.nome = txtNome.text;
      //EditFamilyController.instance.parentesco = txtParentesco.text;
       EditFamilyController.instance.dataNasc = dataController;
      EditFamilyController.instance.image =
          EditFamilyController.instance.imagemTemporaria;
      FamilyModel.instance.family.add(new Family(
        title: txtNome.text,
        date: dataController,
        Telephone: int.parse(txtTelephone.text),
      ));
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
                Navigator.pushNamed(context, '/seeFamily');
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
          children: <Widget>[
            Container(
          height: 50,
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          decoration:
              BoxDecoration(border: Border.all(), color: Colors.lightBlue),
        ),
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
