import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/models/FamilyModel.dart';
class AddFamilyController{

  void excludeById(int identifier){
    FamilyModel.instance.family.removeAt(identifier);

  }
}