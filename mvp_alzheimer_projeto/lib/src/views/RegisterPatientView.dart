import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/CustomButton.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';
import 'package:projeto_estudo/src/controller/SessionController.dart';

import '../components/AddMemoryComponents.dart';
import '../components/CustomInputs.dart';
import '../models/MainProfileModel.dart';
import '../models/MemoryModel.dart';

class RegisterPatientView extends StatefulWidget {
  const RegisterPatientView({Key? key}) : super(key: key);

  @override
  RegisterPatientViewState createState() => RegisterPatientViewState();
}

class RegisterPatientViewState extends State<RegisterPatientView> {
  @override
  Widget build(BuildContext context) {
    var args;
    TextEditingController nameController = new TextEditingController();
    DateTime dateController = DateTime.now();
    TextEditingController diseaseController = new TextEditingController();
    TextEditingController casoController = new TextEditingController();
    TextEditingController emailController = new TextEditingController();
    TextEditingController senhaController = new TextEditingController();
    TextEditingController repitaSenhaController = new TextEditingController();
    String imageLink = "assets/images/imagemEscolha.png";



    if(ModalRoute.of(context)!.settings.arguments != null){
      args = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
      nameController.text = (args['name']!=null)?args['name'].toString():"";
      diseaseController.text = (args['disease']!=null)?args['disease'].toString():"";
      casoController.text = (args['case']!=null)?args['case'].toString():"";
      emailController.text = (args['email']!=null)?args['email'].toString():"";
      senhaController.text = (args['senha']!=null)?args['senha'].toString():"";
      repitaSenhaController.text = (args['repSenha']!=null)?args['repSenha'].toString():"";
      dateController = (args['date']!=DateTime.now())?DateTime.parse(args['date'].toString()):DateTime.now();
      imageLink = (args['imageLink']!=null)?args['imageLink'].toString():"";
    }

    return Scaffold(
      backgroundColor: AppController.instance.mainColor,

      appBar: CustomAppBar.instance.getNamedDefault(context, "/patients",
          Text("Cadastrar Paciente", style: TextStyle(color: Colors.black))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 1.3)),
              ),
              child: ImagePickerContainer(
                  imageLink: imageLink,
                  response: () async {
                    imageLink = await AppController.instance
                        .getImage()
                        .then((value) => imageLink = value);
                    Navigator.of(context).pushNamed('/registerPatient', arguments: {
                      'name': nameController.text,
                      'disease': diseaseController.text,
                      'case': casoController.text,
                      'date': dateController.toString(),
                      'imageLink': imageLink,
                      'email':emailController.text,
                      'senha':senhaController.text,
                      'repSenha':repitaSenhaController.text
                    });
                  }),
            ),
            DefaultTextField(
              haveFrame: false,
              title: 'Nome: ',
              myResult: nameController,
            ),
            DateBorderedField(
                onChangeFunction: (value) {
                  dateController = value;
                },
                lastDate: dateController,
                initialValue: dateController),
            DefaultTextField(
              haveFrame: false,
              title: 'Doença: ',
              myResult: diseaseController,
            ),
            DefaultTextField(
              haveFrame: false,
              title: 'Casos Especiais: ',
              myResult: casoController,
            ),
            DefaultTextField(
              haveFrame: false,
              title: 'Usuario: ',
              myResult: emailController,
            ),
            DefaultTextField(
              haveFrame: false,
              title: 'Senha: ',
              myResult: senhaController,isPassword: true
            ),
            DefaultTextField(
              haveFrame: false,
              title: 'Repita a senha: ',
              myResult: repitaSenhaController,isPassword: true
            ),
            Container(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultButton(
                  color: Color.fromRGBO(173, 216, 230, 1),
                  title: 'Salvar',
                  response: () {
                    print(SessionController.instance.sessionID);
                    if(senhaController.text==repitaSenhaController.text){
                      Paciente myPac = Paciente(
                          doenca: diseaseController.text,
                          anotacoes: casoController.text,
                          id: SessionController.instance.sessionID,
                          dataNasc: dateController,
                          idUsuario: SessionController.instance.sessionID,
                          nome: nameController.text

                      );
                      SessionController.instance.registerPatient("1", myPac, emailController.text, senhaController.text).then((value) =>
                          SessionController.instance.getPatients().then((value) => Navigator.of(context).pushNamed('/patients'))
                      );

                    }else{
                      print("senhas diferentes");
                    }
                  },
                  enableBounds: true,
                  bounds: {125.0: 50.0},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
