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
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: AppController.instance.mainColor,
        title: Center(child: Text("Registrar paciente")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

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
            DefaultTextField(haveFrame: false, title: 'Data de Nascimento: ', myResult: emailController,),
            DefaultTextField(haveFrame: false, title: 'Doença: ', myResult: emailController,),


            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,

                  ),
                ),
              ),
              child: DefaultTextField(haveFrame: false, title: 'Casos Especiais: ', myResult: emailController,),
            ),
            Container(height: 100,),
            DefaultButton(color: Color.fromRGBO(173, 216, 230, 1), title: 'Salvar', response: () { Navigator.of(context).pushNamed('/patients'); }, enableBounds: true, bounds: {125.0:50.0},),
          ],
        ),
      ),
    );
  }
}
