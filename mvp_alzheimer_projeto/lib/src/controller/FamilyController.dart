import 'package:flutter/material.dart';

class FamilyController extends ChangeNotifier {
  static FamilyController instance = FamilyController();

  String nome = "";
  String parentesco = "";
  DateTime dataNasc = DateTime.now();
  ImageProvider<Object> image = AssetImage('assets/images/pelezin.jpg');
  ImageProvider<Object> imagemTemporaria =
      AssetImage('assets/images/pelezin.jpg');

  final now = DateTime.now();
}
