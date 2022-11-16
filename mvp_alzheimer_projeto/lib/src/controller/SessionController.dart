

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_estudo/AppController.dart';

import '../models/MainProfileModel.dart';
class SessionController {
  static SessionController instance = SessionController();
  int sessionID = 0;
  int cuidadorID = 0;
  int pacienteID = 0;




  Future<String> tryLogin(String email,String passWord) async {
    print(email+passWord);
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email':email,
        'senha':passWord,
      }),
    );
    print(jsonDecode(json.encode(response.body)));

    dynamic returned = jsonDecode(response.body);
    print(returned);
    if(returned.toString().substring(1,5)=="data"){
      print("LOGOUUUUUUUUUUUUUU");
      sessionID =  int.parse(returned["data"]["idUsuario"].toString());
      cuidadorID = int.parse(returned["data"]["idCuidador"].toString());
      print(sessionID);
      return "logou";
    }else{//pega id pra consultas futuras e guarda no app
      return "errou";
    }
  }


  Future<bool> register(String tipoCuidador,String email,String passWord) async {
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'tipo_cuidador':tipoCuidador,
        'email':email,
        'senha':passWord,
      }),
    );
    print(response.body.toString());
    dynamic returned = jsonDecode(json.encode(response.body));
    if(returned.toString().substring(1,8)=="mensagem"){
      return true;
    }else{
      return false;
    }
  }


  void registerPatient(String tipoCuidador,Paciente patient,String email,String senha) async {
    print(patient.dataNasc.toString().substring(0,10));
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/paciente/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'tipo_cuidador':"1",
        'email':email,
        'senha':senha,
        'idUsuario':sessionID,
        'doenca':patient.doenca,
        'observacao':patient.anotacoes,
        'nome':patient.nome,
        'data_nascimento':patient.dataNasc.toString(),
        'idCuidador':cuidadorID,
      }),
    );
    print(response.body.toString());
    dynamic posCollected = jsonDecode(json.encode(response.body));
    // if(posCollected["message"]!="Não encontrado"){
    //   ;
    // }else{
    //   ;
    // } qnd for usuario 2 vai receber o cuidador, mandar o cuidador nesse registro 1 o paciente, vai ser o restante de login
  }

  Future<void> getPatients() async {
    int contador = 0;
    List<Paciente> pacientes = [];
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/paciente/consulta/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'idCuidador':cuidadorID,
      }),
    );
    print(jsonDecode(json.encode(response.body)));
    dynamic returned = jsonDecode(response.body);
      for(Map<String, dynamic> a in returned){
        pacientes.add(Paciente(
            doenca: a["Doenca"],
            anotacoes: "teste",
            id: a["idPaciente"],
            dataNasc: DateTime.parse(a["Data_Nascimento"].toString()),
            idUsuario: a["idUsuario"],
            nome: a["Nome"]
        ));
      }
      AppController.instance.pacientes = pacientes;
  }
}
/*
*
* */
