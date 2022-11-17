
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projeto_estudo/AppController.dart';
import 'package:projeto_estudo/src/models/FamilyModel.dart';

import '../models/MainProfileModel.dart';
import '../models/MemoryModel.dart';
import '../remedios/ViewRemedioPage.dart';
class SessionController {
  static SessionController instance = SessionController();
  int sessionID = 0;
  int cuidadorID = 0;
  int pacienteID = 0;
  bool isCuidador = true;


  Future<String> tryLogin(String email,String passWord) async {
    isCuidador=true;
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

      if(int.parse(returned["data"]["TIPO_CUIDADOR_PACIENTE"].toString())==1){
        isCuidador=false;
        cuidadorID = int.parse(returned["data"]["idPaciente"].toString());
      }else{
        cuidadorID = int.parse(returned["data"]["idCuidador"].toString());
      }
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


  Future<void> registerPatient(String tipoCuidador,Paciente patient,String email,String senha) async {
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
        'Observacao':patient.anotacoes,
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

  Future<void> registerMemory(Memory memory) async {
    print(memory.date);
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/memoria/register/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "idPaciente":pacienteID,
        "nome":memory.title,
        "data":memory.date.toString(),
        "anotacao":memory.description
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

  Future<void> registerFamily(Family family) async {
    print("Registrando Familiar"+pacienteID.toString());
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/familia/register/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "idPaciente":pacienteID,
        "nome":family.title,
        "parentesco":family.parentesco,
        "data_nascimento":family.date.toString(),
        "telefone":family.getTelephone()
      }),
    );
    print(response.body.toString());
    dynamic posCollected = jsonDecode(json.encode(response.body));
}


  Future<void> registerRemedy(Remedio rem) async {
    print("registrar Remedio"+rem.hora.toString());
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/remedio/register/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "idPaciente":pacienteID,
        "nomeRedio":rem.nome,
        "dosagem": rem.dosagem,
        "horario": "${rem.hora?.hour}:${rem.hora?.minute}:00",
        "observacao": rem.observacao
      }),
    );
    print(response.body.toString());
    dynamic posCollected = jsonDecode(json.encode(response.body));
  }

  Future<void> editFamily(Family family) async {
    print("Registrando Familiar"+family.date.toString());
    final response = await http.put(
      Uri.parse('https://alzheimer-db.herokuapp.com/familia/edit/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "idFamilia":family.idBanco,
        "nome":family.title,
        "parentesco":family.parentesco,
        "dataNascimento":family.date.toString(),
        "telefone":family.getTelephone()
      }),
    );
    print(response.body.toString());
    dynamic posCollected = jsonDecode(json.encode(response.body));
  }

  Future<void> editMemory(Memory memory) async {
    print("MEMORIA: ${memory.idBanco}");
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/memoria/edit/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({

        "nome":memory.title,
        "data":memory.date.toString(),
        "anotacao":memory.description,
        "idMemoria":memory.idBanco,
      }),
    );
    print(response.body.toString());
    dynamic posCollected = jsonDecode(json.encode(response.body));
  }

  Future<String> editRemedy(Remedio rem) async {
    print("Registrando Remedio"+rem.hora.toString());
    final response = await http.put(
      Uri.parse('https://alzheimer-db.herokuapp.com/remedio/edit/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "idRemedios":rem.idBanco,
        "nomeRedio":rem.nome,
        "dosagem": rem.dosagem,
        "horario": "${rem.hora?.hour}:${rem.hora?.minute}:00",
        "observacao": rem.observacao
      }),
    );
    print(response.body.toString());
    dynamic posCollected = jsonDecode(json.encode(response.body));
    return "deu";
  }

  Future<void> removeMemory(int id) async {
    print("Remove: ${id}");
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/memoria/delete/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "idMemoria":id,
      }),
    );
    print(response.body.toString());
    dynamic posCollected = jsonDecode(json.encode(response.body));
  }

  Future<void> removeRemedy(int id) async {
    print("Remove: ${id}");
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/remedio/delete/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "idRemedios":id,
      }),
    );
    print(response.body.toString());
    dynamic posCollected = jsonDecode(json.encode(response.body));
    return;
  }

  Future<void> removeFamily(int id) async {
    print("Removendo Remedio"+id.toString());
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/familia/delete/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "idFamilia": id,
      }),
    );
    print(response.body.toString());
    dynamic posCollected = jsonDecode(json.encode(response.body));
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
    dynamic returned = jsonDecode(response.body);
      for(Map<String, dynamic> a in returned){
        pacientes.add(Paciente(
            doenca: a["Doenca"],
            anotacoes: "teste",
            id: a["idPaciente"],
            dataNasc: DateTime.parse(a["Data_Nascimento"].toString()),
            idUsuario: a["idUsuario"],
            nome: a["Nome"],

        ));
      }
      AppController.instance.pacientes = pacientes;
  }



  Future<void> getMemories() async {
    int contador = 0;
    List<Memory> memories = [];
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/memoria/consulta/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'idPaciente':pacienteID,
      }),
    );
    dynamic returned = jsonDecode(response.body);
    print(returned);
    for(Map<String, dynamic> a in returned){
      memories.add(Memory(
          idBanco: a["idMemoria"],
          title: a["Nome"],
          date: DateTime.parse(a["Data"].toString()),
          description:a["Anotacao"] ,
          identifier: contador,
          image: FileImage(io.File("assets/images/imagemEscolha.png"))
      ));
      contador++;
    }
    MemoryModel.instance.memories = memories;

}

  Future<void> getFamily() async {
    print("Paciente: ${pacienteID}");
    int contador = 0;
    List<Family> family = [];
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/familia/consulta/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'idPaciente':pacienteID,
      }),
    );

    dynamic returned = jsonDecode(response.body);

    // print(returned);
    for(Map<String, dynamic> a in returned){
      family.add(Family(
          title: a["Nome"],
          date: DateTime.parse(a["DataNascimento"].toString()),
          parentesco: a["Parentesco"],
          identifier: FamilyModel.instance.famili.length,
          image: FileImage(io.File("assets/images/imagemEscolha.png")),
          Telephone: a["Telefone"]
          ,idBanco: a["idFamilia"]
      )
      );
      contador++;
    }
    FamilyModel.instance.famili = family;

  }

  Future<String> getRemedios() async {
    print("PacienteAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA: ${pacienteID}");
    int contador = 0;
    List<Remedio> remedios = [];
    final response = await http.post(
      Uri.parse('https://alzheimer-db.herokuapp.com/remedio/consulta/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'idPaciente':pacienteID,
      }),
    );

    dynamic returned = jsonDecode(response.body);
    AppController.instance.rmdCriados = 0;
     print(returned);
    for(Map<String, dynamic> a in returned){
      print(a["Horario"].toString().substring(0,2));
      print(a["Horario"].toString().substring(3,5));
      remedios.add(Remedio(
        nome: a["NomeRedio"],
        dosagem: a["Dosagem"],
        hora: TimeOfDay(hour: int.parse(a["Horario"].toString().substring(0,2)),minute: int.parse(a["Horario"].toString().substring(3,5))),
        observacao: a["observacao"],
        id : AppController.instance.rmdCriados,
        idBanco: a["idRemedios"]
      )
      );

      AppController.instance.rmdCriados++;
      contador++;
    }
    AppController.instance.remedio = remedios;
    return "deu";

  }



}



/*
*
* */
