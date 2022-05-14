import 'dart:ui';
import 'package:flutter/material.dart';
class ProfileModel{
  static ProfileModel instance = ProfileModel();

}

class Profile {
   Profile({Key? key, required this.nome, required this.dataNasc, required this.image}) ;
   String nome ;
   DateTime dataNasc;
   ImageProvider<Object> image;



}