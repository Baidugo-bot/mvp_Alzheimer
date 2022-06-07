import 'package:flutter/material.dart';


class ProfileController extends ChangeNotifier{
  static ProfileController instance = ProfileController();

   String nome ="";
   DateTime dataNasc = DateTime.now();
   ImageProvider<Object> image = AssetImage('assets/images/pelezin.jpg');
   ImageProvider<Object> imagemTemporaria = AssetImage('assets/images/pelezin.jpg');

  final now = DateTime.now();
}