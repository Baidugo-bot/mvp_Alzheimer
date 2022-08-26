import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/CustomButton.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';

import '../components/AddMemoryComponents.dart';
import '../components/CustomInputs.dart';
import '../models/MemoryModel.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: AppController.instance.mainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BorderedText(
              strokeWidth: 1,
              child: Text("Memories",style: TextStyle(fontSize: 20),),
            ),
            Container(height: 10,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child:  Image.asset('assets/images/theme.png',height: 100),
            ),

            DefaultTextField(haveFrame: false, title: 'Nome: ', myResult: emailController,),
            DefaultTextField(haveFrame: false, title: 'Email: ', myResult: emailController,),
            DefaultTextField(haveFrame: false, title: 'Senha: ', myResult: emailController,),
            DefaultTextField(haveFrame: false, title: 'Confirmar senha: ', myResult: emailController,),
            DefaultMarkBox(title: "Cuidador: ",color: Colors.green,),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,

                  ),
                ),
              ),
              child: DefaultMarkBox(title: "Paciente:",color: Colors.red,),
            ),
            Container(height: 10,),
            DefaultButton(color: Color.fromRGBO(173, 216, 230, 1), title: 'Cadastrar-se', response: () { Navigator.of(context).pushNamed('/patients'); }, enableBounds: true, bounds: {250.0:50.0},),
          ],
        ),
      ),
    );
  }
}
