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