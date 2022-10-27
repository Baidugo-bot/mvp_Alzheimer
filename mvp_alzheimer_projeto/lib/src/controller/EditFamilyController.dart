import 'package:flutter/material.dart';

class EditFamilyController extends ChangeNotifier {
  static EditFamilyController instance = EditFamilyController();

  String nome = "";
  String parentesco = "";
  int Telephone = 0;
  DateTime dataNasc = DateTime.now();
  ImageProvider<Object> image = AssetImage('assets/images/pelezin.jpg');
  ImageProvider<Object> imagemTemporaria =
      AssetImage('assets/images/pelezin.jpg');

  final now = DateTime.now();
}
