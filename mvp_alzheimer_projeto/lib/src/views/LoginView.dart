import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';

import '../components/AddMemoryComponents.dart';
import '../components/CustomButton.dart';
import '../components/CustomInputs.dart';
import '../models/MemoryModel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: AppBar(
        backgroundColor: AppController.instance.mainColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 10,),
            Image.asset('assets/images/theme.png',height: 200),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: BorderedText(
                strokeWidth: 1,
                child: Text("Memories",style: TextStyle(fontSize: 35),),
              ),
            ),

            DefaultTextField(haveFrame: false, title: 'Email: ', myResult: emailController,),
            DefaultTextField(haveFrame: false, title: 'Senha: ', myResult: passwordController,),
            Container(height: 25,),
            DefaultButton(color: Color.fromRGBO(173, 216, 230, 1), title: 'Entrar', response: () { Navigator.of(context).pushNamed('/patients'); }, enableBounds: true, bounds: {280.0:50.0},),
            Container(height: 25,),
            DefaultButton(color: Color.fromRGBO(173, 216, 230, 1), title: 'Cadastrar-se', response: () { Navigator.of(context).pushNamed('/register'); }, enableBounds: true, bounds: {280.0:50.0},),
          ],
        ),
      ),
    );
  }
}
