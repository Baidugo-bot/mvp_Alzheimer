import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/models/MainProfileModel.dart';

class ProfileController extends ChangeNotifier {
  static ProfileController instance = ProfileController();

  String nome = "Usuário";
  DateTime dataNasc = DateTime.now();
  String doenca ="";
  String observacoes = "";
  ImageProvider<Object> image = AssetImage("assets/images/imagemEscolha.png");
  ImageProvider<Object> imagemTemporaria =
      AssetImage('assets/images/pelezin.jpg');
  String imageLink = "assets/images/imagemEscolha.png";
  final now = DateTime.now();


  void updateProfile(Paciente pac){
    this.nome = pac.nome;
    this.dataNasc = pac.dataNasc;
    this.doenca = pac.doenca;
    this.observacoes = pac.anotacoes;
  }
}
