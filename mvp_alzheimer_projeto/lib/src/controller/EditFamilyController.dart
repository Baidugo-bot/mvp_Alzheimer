import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/models/FamilyModel.dart';
class EditFamilyController{
  static EditFamilyController instance = EditFamilyController();

  get imagemTemporaria => null;

  set parentesco(String parentesco) {}

  set image(image) {}

  set dataNasc(DateTime dataNasc) {}

  set nome(String nome) {}
  void excludeById(int identifier){
    FamilyModel.instance.family.removeAt(identifier);

String nome = "";
  DateTime dataNasc = DateTime.now();
  ImageProvider<Object> image = AssetImage('assets/images/pelezin.jpg');
  ImageProvider<Object> imagemTemporaria =
      AssetImage('assets/images/pelezin.jpg');
       final now = DateTime.now();
  }

  void changeById(int identifier, Family newFamily){
    FamilyModel.instance.family.forEach((e) {
       //print(newFamily.getDescription()+" - "+newFamily.getNome());
      // if(e.identifier==identifier){
      //   e.changeFamily(newFamily);
      // }
    });
  }
}