import 'package:flutter/material.dart';

import 'MemoryModel.dart';

abstract class TipoUsuario {
  int id= 0;
  int idUsuario = 0;
  String nome = "";
  DateTime dataNasc = DateTime.now();
}


class Usuario {
  int idUsuario = 0;
  String tipoCuidador = "";
  String email = "";
  String senha = "";
  TipoUsuario userData;

  Usuario({Key? key, required this.idUsuario, required this.tipoCuidador, required this.email, required this.senha,required this.userData});
}


class Paciente implements TipoUsuario {
  String doenca = "";
  String anotacoes = "";
  List<Remedio>? remedios;
  List<Memory>? memorias;
  List<MembroFamilia>? familia;

  Paciente({this.familia ,this.memorias, required this.doenca,required this.anotacoes, this.remedios,required this.id,required this.dataNasc,required this.idUsuario,required this.nome});

  @override
  DateTime dataNasc = DateTime.now();

  @override
  int id = 0 ;

  @override
  int idUsuario = 0;

  @override
  String nome = "";
}

class Cuidador implements TipoUsuario {
  @override
  DateTime dataNasc = DateTime.now();

  @override
  int id = 0 ;

  @override
  int idUsuario = 0;

  @override
  String nome = "";

  List<Paciente> pacientes ;

  Cuidador({required this.id,required this.nome,required this.idUsuario,required this.dataNasc,required this.pacientes});


}

class Remedio{
  int idRemedio = 0;
  String nome="";
  int dosagem = 0;
  int duracao = 0;

  Remedio({Key? key, required this.idRemedio, required this.nome, required this.dosagem, required this.duracao});
}


class MembroFamilia {
  int idMembro = 0;
  String nome="";
  String parentesco="";
  DateTime dataNasc = DateTime.now();
  String telefone = "";
  Image foto ;

  MembroFamilia({Key? key, required this.idMembro,required this.nome,required this.parentesco,required this.dataNasc,required this.telefone,required this.foto});
}








