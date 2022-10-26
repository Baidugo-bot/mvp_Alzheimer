import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/CustomButton.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';

import '../components/AddMemoryComponents.dart';
import '../components/CustomInputs.dart';
import '../models/MemoryModel.dart';

class RegisterPatientView extends StatefulWidget {
  const RegisterPatientView({Key? key}) : super(key: key);

  @override
  RegisterPatientViewState createState() => RegisterPatientViewState();
}

class RegisterPatientViewState extends State<RegisterPatientView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = new TextEditingController();
    DateTime dateController = DateTime.now();
    TextEditingController diseaseController = new TextEditingController();
    TextEditingController casesController = new TextEditingController();
    String imageLink = "assets/images/imagemEscolha.png";
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getDefault(context,"patients"),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(height: 10,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black,width: 1.3)),
              ),
              child: ImagePickerContainer(imageLink: imageLink, response: ()async{
                imageLink =  await AppController.instance.getImage().then((value) => imageLink = value);
                Navigator.of(context).pushNamed('/addMemory', arguments: {'name':nameController.text, 'date': dateController.toString(),'disease':diseaseController.text, 'imageLink': imageLink});
                }
              ),
            ),

            DefaultTextField(haveFrame: false, title: 'Nome: ', myResult: nameController,),
            DateBorderedField(onChangeFunction: (value){dateController = value;}, lastDate: dateController, initialValue: dateController),
            DefaultTextField(haveFrame: false, title: 'Doença: ', myResult: diseaseController,),


            Container(
              width: double.infinity,
              child: DefaultTextField(haveFrame: false, title: 'Casos Especiais: ', myResult: casesController,),
            ),
            Container(height: 35,),
            DefaultButton(color: Color.fromRGBO(173, 216, 230, 1), title: 'Salvar', response: () { Navigator.of(context).pushNamed('/patients'); }, enableBounds: true, bounds: {125.0:50.0},),
          ],
        ),
      ),
    );
  }
}
