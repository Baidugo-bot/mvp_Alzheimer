import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/models/MemoryModel.dart';
class MemoryPacienteController{
  static MemoryPacienteController instance = MemoryPacienteController();
  late String title="teste";
  late DateTime date = DateTime.now();
  late String description = "oi";
  late int identifier ;
  late ImageProvider<Object> image;
  late String? imgLink = "assets/images/imagemEscolha.png";


}
class FamilyPacienteController{
  static FamilyPacienteController instance = FamilyPacienteController();
  late String title = "Samuel";
  late DateTime date = DateTime.now();
  late String Telephone = '45998466105';
  late String parentesco = "Filho";
  late int identifier;
  late ImageProvider<Object> image;
  String? imgLink = "";

}

class PerfilPacienteController{
  static PerfilPacienteController instance = PerfilPacienteController();
  String nome = "Usuário";
  DateTime dataNasc = DateTime.now();
  ImageProvider<Object> image = AssetImage("assets/images/imagemEscolha.png");
  ImageProvider<Object> imagemTemporaria =
  AssetImage('assets/images/pelezin.jpg');
  String imageLink = "assets/images/imagemEscolha.png";

}