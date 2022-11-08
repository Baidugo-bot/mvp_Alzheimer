import 'dart:io';

import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  static ProfileController instance = ProfileController();

  String nome = "Usuário";
  DateTime dataNasc = DateTime.now();
  ImageProvider<Object> image = AssetImage("assets/images/imagemEscolha.png");
  ImageProvider<Object> imagemTemporaria =
      AssetImage('assets/images/pelezin.jpg');
  String imageLink = "assets/images/imagemEscolha.png";
  final now = DateTime.now();
}
