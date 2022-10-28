import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/components/AddFamilyComponents.dart';
import 'package:projeto_estudo/src/controller/EditFamilyController.dart';
import '../components/EditFamilyComponetes.dart';
import '../controller/EditFamilyController.dart';
import '../models/FamilyModel.dart';
class EditFamilyView extends StatefulWidget {
  @override
  EditFamilyViewState createState() => EditFamilyViewState();
}

class EditFamilyViewState extends State<EditFamilyView> {
  TextEditingController txtNome = TextEditingController();
    TextEditingController txtParentesco = TextEditingController();
  TextEditingController txtTelephone = TextEditingController();
  DateTime dataController = DateTime.now();

  get args => null;

  

  get imageController => null;

  void Salvar() {
    setState(() {
      TextEditingController titleController =  TextEditingController();
      TextEditingController descController = TextEditingController();
      EditFamilyController.instance.nome = txtNome.text;
      EditFamilyController.instance.parentesco = txtParentesco.text;
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: 430,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2, color: Colors.grey),
                ),
              ),
              child: GestureDetector(
                onTap: () {},
                // child: Image(
                //   image: args["family"]!.getImage(),
                //   height: 250,
                // ),
              ),
            ),
            Container(
              height: 30,
            ),
            BorderedTextField(
              title: 'Titulo:',
              haveFrame: false,
              myResult: titleController,

            ),
            Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                              ),
                              child: DateBorderedField(
                                onChangeFunction: (DateTime date) {dataController = date;},
                              ),
                            ),
            BorderedTextField(
              title: "Anotacoes:",
              haveFrame: true,
              myResult: descController,
            ),
            Container(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  title: "Salvar",
                  color: Colors.green,
                  response: (){
                if(titleController.text=="" || descController.text==""){
                  print("Preencha");
                }else{

                  FamilyModel.instance.family.add(new Family(
                      title: titleController.text, date: DateTime.now(),
                      description: descController.text,
                      identifier: FamilyModel.instance.family.length,
                    image: imageController, Telephone: 0));
                  Navigator.of(context).pushNamed('/family', arguments: {});
                }



              },
                ),
                Container(width: 10,),
                CustomButton(
                  title: "Apagar",
                  color: Colors.red,
                  response: (){
                    EditFamilyController.instance.excludeById(args["family"]!.getIdentifier());
                    Navigator.of(context).pushNamed('/family', arguments: {});
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
