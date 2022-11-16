import 'dart:io';

import 'package:flutter/material.dart';

import 'package:jiffy/jiffy.dart';
//
import 'package:projeto_estudo/src/controller/ProfileController.dart';


import '../../AppController.dart';
import '../components/CustomButton.dart';

class ProfilePaciente extends StatefulWidget {
  String nome = "";
  int data = 0;
  @override
  _ProfilePacienteState createState() => _ProfilePacienteState();
}

class _ProfilePacienteState extends State<ProfilePaciente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppController.instance.mainColor,
      appBar: CustomAppBar.instance.getNamedDefault(context, "/", Text("Perfil",style: TextStyle(color: Colors.black),),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
//informações tela principal

          CircleAvatar(
              backgroundColor: Colors.white,
              radius: 85,
              child: CircleAvatar(
                backgroundImage: ProfileController.instance.image,
                radius: 100,
              )
          ),

          Text(
            "Nome: ${ProfileController.instance.nome}",
            style: TextStyle(fontSize: 24,color: Colors.black),
          ),
          Text(
            "Nascimento: ${Jiffy(ProfileController.instance.dataNasc).format("dd/MM/yyyy")}",
            style: TextStyle(fontSize: 24,color: Colors.black),
          ),
          Container(
            height: 80,
          ),
        ],
      ),
    );
  }
}
