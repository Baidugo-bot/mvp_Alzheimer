import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/CustomButton.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';

import '../components/AddMemoryComponents.dart';
import '../components/CustomInputs.dart';
import '../controller/SessionController.dart';
import '../models/MemoryModel.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = new TextEditingController();
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    TextEditingController confirmController = new TextEditingController();
    bool cuidadorController = true;
    bool pacienteController = true;

    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getDefault(context,"/login"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BorderedText(
              strokeWidth: 0,
              child: Text("Memories",style: TextStyle(fontSize: 25,color: Colors.black,shadows: [Shadow(color: Colors.black54.withOpacity(0.2),offset: Offset(1.5, 2.3))]),),
            ),
            Container(height: 10,),
            Container(
              width: double.infinity,

              child:  Image.asset('assets/images/theme.png',height: 100),
            ),

            DefaultTextField(haveFrame: false, title: 'Nome ', myResult: nameController,),
            Container(height: 10,),
            DefaultTextField(haveFrame: false, title: 'Usuario ', myResult: emailController,),
            Container(height: 10,),
            DefaultTextField(haveFrame: false, title: 'Senha ', myResult: passwordController,isPassword: true),
            Container(height: 10,),
            DefaultTextField(haveFrame: false, title: 'Confirmar senha ', myResult: confirmController,isPassword: true),

            Container(height: 10,),
            DefaultButton(color: Color.fromRGBO(173, 216, 230, 1), title: 'Cadastrar-se', response: () {
              //validar apenas um escolhido, mostrar mensagem
              if((passwordController.text!=confirmController.text) || emailController.text=="" || nameController.text=="" ){
                print("nao veio");
              }else{
                SessionController.instance.register(
                "2",
                  emailController.text,
                  passwordController.text
                  ).then((valor) =>
                (valor!="Email já cadastrado!")?SessionController.instance.getPatients().then((value) => registerSuccess(valor)):AppController.instance.messageResponse(context, valor)
                );

              }
              }, enableBounds: true, bounds: {250.0:50.0},),
          ],
        ),
      ),
    );
  }

  void registerSuccess(String value){


    Navigator.of(context).pushNamed('/login');
    AppController.instance.messageResponse(context, value);
  }
}
