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
            DefaultTextField(
              haveFrame: false,
              title: 'Nome ',
              myResult: nameController,
            ),
            Container(height: 10,),
            DateBorderedField(
                onChangeFunction: (value) {
                  dateController = value;
                },
                lastDate: dateController,
                dateTime: false,
                initialValue: dateController),
            Container(height: 10,),
            DefaultTextField(
              haveFrame: false,
              title: 'Doença ',
              myResult: diseaseController,
            ),
            Container(height: 10,),
            DefaultTextField(
              haveFrame: false,
              title: 'Casos Especiais ',
              myResult: casoController,
            ),
            Container(height: 10,),
            DefaultTextField(
              haveFrame: false,
              title: 'Usuario ',
              myResult: emailController,
            ),
            Container(height: 10,),
            DefaultTextField(
              haveFrame: false,
              title: 'Senha ',
              myResult: senhaController,isPassword: true
            ),
            Container(height: 10,),
            DefaultTextField(
              haveFrame: false,
              title: 'Repita a senha ',
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
                    if(senhaController.text!=repitaSenhaController.text || senhaController.text=="" || emailController.text=="" || nameController.text=="" || diseaseController.text=="" || casoController.text=="" || emailController.text=="" ){
                      AppController.instance.messageResponse(context, "Informacoes faltantes ou senhas diferentes.");

                    }else{
                      Paciente myPac = Paciente(
                          doenca: diseaseController.text,
                          anotacoes: casoController.text,
                          id: SessionController.instance.sessionID,
                          dataNasc: dateController,
                          idUsuario: SessionController.instance.sessionID,
                          nome: nameController.text

                      );
                      SessionController.instance.registerPatient("1", myPac, emailController.text, senhaController.text).then((value) =>
                        (value!="Email já cadastrado!")?SessionController.instance.getPatients().then((value) => Navigator.of(context).pushNamed('/patients')):AppController.instance.messageResponse(context, value)
                      );
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
