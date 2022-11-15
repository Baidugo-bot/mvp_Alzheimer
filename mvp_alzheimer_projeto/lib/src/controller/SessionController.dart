

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/MainProfileModel.dart';
class SessionController {
  static SessionController instance = SessionController();
  int sessionID = 0;



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
    print(returned.toString().substring(1,5));
    if(returned.toString().substring(1,5)=="data"){
      print("LOGOUUUUUUUUUUUUUU");
      sessionID =  int.parse(returned["data"]["idUsuario"].toString());
      print(sessionID);
      return "logou";
    }else{//pega id pra consultas futuras e guarda no app
      return "errou";
    }
  }


  void register(String tipoCuidador,String email,String passWord) async {
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
    dynamic posCollected = jsonDecode(json.encode(response.body));
    dynamic posUpdated = jsonDecode(json.encode(posCollected["data"]));
    // if(posCollected["message"]!="Não encontrado"){
    //   ;
    // }else{
    //   ;
    // }
  }


  void registerPatient(String tipoCuidador,Paciente patient,String email,String senha) async {
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/register/'),
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
        'nome':patient.nome
      }),
    );
    print(response.body.toString());
    dynamic posCollected = jsonDecode(json.encode(response.body));
    // if(posCollected["message"]!="Não encontrado"){
    //   ;
    // }else{
    //   ;
    // }
  }

  void getPatients() async {
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/paciente/consulta/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'idUsuario':sessionID.toString(),
      }),
    );
    print(jsonDecode(json.encode(response.body)));

    dynamic returned = jsonDecode(response.body);
  }
}