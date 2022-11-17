import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/components/EditMemoryComponents.dart';

import '../components/AddMemoryComponents.dart';
import '../components/CustomButton.dart';
import '../components/CustomInputs.dart';
import '../controller/LoginController.dart';
import '../controller/SessionController.dart';
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
            Container(
              height: 10,
            ),
            Image.asset('assets/images/theme.png', height: 200),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: BorderedText(
                strokeWidth: 1,
                child: Text(
                  "Memories",
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
            DefaultTextField(
              title: 'Email: ',
              myResult: emailController,
            ),
            DefaultTextField(
                title: 'Senha: ',
                myResult: passwordController,
                isPassword: true),
            Container(
              height: 25,
            ),
            DefaultButton(
              color: Color.fromRGBO(173, 216, 230, 1),
              title: 'Entrar',
              response: () async {
                print(SessionController.instance.isCuidador);
                SessionController.instance.tryLogin(emailController.text, passwordController.text).then((value) => {

                  if(SessionController.instance.isCuidador){
                    SessionController.instance.getPatients().then((value) => Navigator.of(context).pushNamed('/patients', arguments: {}))
                  }else{
                    Navigator.of(context).pushNamed('/', arguments: {})
                }
                });
              },
              enableBounds: true,
              bounds: {320.0: 60.0},
            ),
            Container(
              height: 35,
            ),
            DefaultButton(
              color: Color.fromRGBO(173, 216, 230, 1),
              title: 'Cadastrar-se',
              response: () {
                Navigator.of(context).pushNamed('/register');
              },
              enableBounds: true,
              bounds: {320.0: 60.0},
            ),
          ],
        ),
      ),
    );
  }
}
