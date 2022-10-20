import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/models/FamilyModel.dart';
class EditFamilyController{
  static EditFamilyController instance = EditFamilyController();
  void excludeById(int identifier){
    FamilyModel.instance.family.removeAt(identifier);

  }

  void changeById(int identifier, Family newFamily){
    FamilyModel.instance.family.forEach((e) {
      // print(newFamily.getDescription()+" - "+newFamily.getTitle());
      // if(e.identifier==identifier){
      //   e.changeFamily(newFamily);
      // }
    });
  }
}