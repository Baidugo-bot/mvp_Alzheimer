import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projeto_estudo/src/models/FamilyModel.dart';
import 'package:projeto_estudo/src/models/MemoryModel.dart';
class FamilyController extends ChangeNotifier {
  static FamilyController instance = FamilyController();

  String nome = "";
  String parentesco = "";
  int Telephone = 0;
  DateTime dataNasc = DateTime.now();
  ImageProvider<Object> image = AssetImage('assets/images/pelezin.jpg');
  ImageProvider<Object> imagemTemporaria =
      AssetImage('assets/images/pelezin.jpg');

  final now = DateTime.now();



  void excludeById(int identifier){
    MemoryModel.instance.memories.removeAt(identifier);
    int memCount = 0;
    MemoryModel.instance.memories.forEach((element) {
      element.setIdentifier(memCount);
      memCount++;
    });
  }

  void changeById(int identifier, Family newFamily){
    FamilyModel.instance.famili.forEach((e) {
      print(newFamily.getImage().toString()+" - "+newFamily.imgLink.toString());
      if(e.identifier==identifier){
        e.changeFamily(newFamily);
      }
    });
  }
  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
