import 'package:flutter/material.dart';


class Profile extends ChangeNotifier{
  
   String nome ="";
   DateTime dataNasc = DateTime.now();
   ImageProvider<Object> image = AssetImage('assets/images/pelezin.jpg');

  final now = DateTime.now();
}