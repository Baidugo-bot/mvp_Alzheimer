import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/models/FamilyModel.dart';

class EditFamilyController {
  static EditFamilyController instance = EditFamilyController();
  void excludeById(int identifier) {
    FamilyModel.instance.famili.removeAt(identifier);
    int memCount = 0;
    FamilyModel.instance.famili.forEach((element) {
      element.setIdentifier(memCount);
      memCount++;
    });
  }

  void changeById(int identifier, Family newFamily) {
    FamilyModel.instance.famili.forEach((e) {
      print(newFamily.getImage().toString() +
          " - " +
          newFamily.imgLink.toString());
      if (e.identifier == identifier) {
        e.changeFamily(newFamily);
      }
    });
  }
}
