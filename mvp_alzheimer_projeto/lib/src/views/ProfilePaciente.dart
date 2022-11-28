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
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left:  MediaQuery.of(context).size.width/2-60,top: 10),
            child: CircleAvatar(
              radius: 60,
              child: Text(
                ProfileController.instance.nome
                    .substring(0, 1),
                style: TextStyle(fontSize: 55),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 14,),
//informações tela principal


              Text(
                "Nome: ${ProfileController.instance.nome}",
                style: TextStyle(fontSize: 28,color: Colors.black),
              ),
              Container(height: 35,),
              Text(
                "Observacoes: ${ProfileController.instance.observacoes}",
                style: TextStyle(fontSize: 28,color: Colors.black),
              ),
              Container(height: 35,),
              Text(
                "Doenca: ${ProfileController.instance.doenca}",
                style: TextStyle(fontSize: 28,color: Colors.black),
              ),
              Container(height: 35,),
              Text(
                "Nascimento: ${Jiffy(ProfileController.instance.dataNasc).format("dd/MM/yyyy")}",
                style: TextStyle(fontSize: 28,color: Colors.black),
              )
            ],
          ),
        ],
      ),
    );
  }
}
